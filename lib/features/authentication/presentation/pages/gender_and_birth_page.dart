import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackerton_gdg/features/authentication/blocs/authentication.bloc.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/sign_up_scaffold.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/text_field.dart';
import 'package:hackerton_gdg/global/themes/color_palette.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class GenderAndBirthPage extends StatefulWidget {
  const GenderAndBirthPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GenderAndBirthPage());
  }

  @override
  State<GenderAndBirthPage> createState() => _GenderAndBirthPageState();
}

class _GenderAndBirthPageState extends State<GenderAndBirthPage> {
  final FocusNode _focusNode = FocusNode();

  String year = "";
  bool isNext = false;
  GenderType? selectedGenderType;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onGenderTap(GenderType type) {
      setState(() {
        selectedGenderType = type;
      });

      FocusScope.of(context).requestFocus(_focusNode);
    }

    return SignUpScaffold(
      // controller: _scrollController,
      title: "정확한 멘탈케어를 위해\n정보를 더 받아볼게요 :)",
      subTitle: "출생년도와 성별을 알려주세요",
      isNext: year.length == 4 && selectedGenderType != null,
      body: [
        Row(
          children: [
            GenderButton(
              type: GenderType.female,
              selected: selectedGenderType == GenderType.female,
              onTap: () => onGenderTap(GenderType.female),
            ),
            const SizedBox(width: 12),
            GenderButton(
              type: GenderType.male,
              selected: selectedGenderType == GenderType.male,
              onTap: () => onGenderTap(GenderType.male),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (selectedGenderType != null)
          SignUpTextFormField(
            focusNode: _focusNode,
            autoFocus: false,
            keyboardType: TextInputType.number,
            hintText: "출생년도",
            maxLength: 4,
            onChanged: (String value) {
              setState(() {
                year = value;
              });
            },
          ),
      ],
      bottomButtonText: '다음으로',
      bottomButtonOnTap: () {
        FocusScope.of(context).unfocus();

        context.read<AuthenticationBloc>().add(
              AuthenticationFieldChanged(
                FieldType.genderAndBirthYear,
                "${selectedGenderType!.name}/$year",
              ),
            );
      },
    );
  }
}

enum GenderType { male, female }

class GenderButton extends StatelessWidget {
  final GenderType type;
  final Function()? onTap;
  final bool selected;

  const GenderButton({
    super.key,
    required this.type,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String title = '';
    String asset = '';

    switch (type) {
      case GenderType.female:
        title = '여자';
        asset =
            'https://res.cloudinary.com/dv5nvs3ic/image/upload/v1730453300/u1F469_u1F3FB_irmwvb.svg';
        break;

      case GenderType.male:
        title = '남자';
        asset =
            'https://res.cloudinary.com/dv5nvs3ic/image/upload/v1730453300/u1F466_u1F3FB_akw68c.svg';
        break;
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();

          if (onTap != null) onTap!();
        },
        child: Container(
            height: (MediaQuery.of(context).size.width - 44) / 2,
            decoration: BoxDecoration(
              color: selected ? ColorPalette.mint99 : null,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 1,
                color: selected
                    ? ColorTheme.of(context).primary.normal
                    : const Color(0xff70737C).withOpacity(0.22),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    title,
                    style: CustomTextStyle.of(
                      fontColor: ColorTheme.of(context).label.neutral,
                    ).title,
                  ),
                ),
                if (selected)
                  Positioned(
                    top: 20,
                    right: 20,
                    child: SvgPicture.asset('assets/new/icons/check.svg'),
                  ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: SvgPicture.network(
                    asset,
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
