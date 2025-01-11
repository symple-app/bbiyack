import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackerton_gdg/features/authentication/blocs/authentication.bloc.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/sign_up_scaffold.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/text_field.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class NicknamePage extends StatefulWidget {
  const NicknamePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NicknamePage());
  }

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  String nickname = "";
  bool isNext = false;

  @override
  Widget build(BuildContext context) {
    return SignUpScaffold(
      title: "닉네임을\n입력해주세요",
      subTitle: "닉네임을 입력해주세요",
      body: [
        Stack(
          children: [
            SignUpTextFormField(
              keyboardType: TextInputType.name,
              hintText: "닉네임",
              maxLength: 12,
              onChanged: (String value) {
                setState(() {
                  nickname = value;

                  if (value.length > 2) {
                    isNext = true;
                  } else {
                    isNext = false;
                  }
                });
              },
            ),
            if (isNext)
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: SvgPicture.asset('assets/new/icons/check.svg'),
              )
          ],
        ),
        const SizedBox(height: 8),
        if (isNext)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "좋네요, 멋진 이름이네요!",
              style: CustomTextStyle.of(
                fontColor: ColorTheme.of(context).primary.normal,
              ).caption,
            ),
          ),
      ],
      bottomButtonOnTap: () async {
        FocusScope.of(context).unfocus();

        context.read<AuthenticationBloc>().add(
              AuthenticationFieldChanged(
                FieldType.nickname,
                nickname,
              ),
            );
      },
      bottomButtonText: '다음으로',
      isNext: isNext,
    );
  }
}
