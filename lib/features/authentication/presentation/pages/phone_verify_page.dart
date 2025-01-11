import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:hackerton_gdg/features/authentication/blocs/authentication.bloc.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/sign_up_scaffold.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';

class PhoneVerifyPage extends StatefulWidget {
  final String verificationId;

  const PhoneVerifyPage({
    super.key,
    required this.verificationId,
  });

  static Route<void> route(String verificationId) {
    return MaterialPageRoute(
      builder: (_) => PhoneVerifyPage(
        verificationId: verificationId,
      ),
    );
  }

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  bool _isLoading = false;
  String verifyCode = "";

  @override
  Widget build(BuildContext context) {
    return SignUpScaffold(
      title: "인증번호를\n입력해주세요",
      subTitle: "메세지를 확인해주세요",
      body: [
        Row(
          children: [
            Expanded(
              child: Pinput(
                length: 6,
                autofocus: true,
                onChanged: (String value) {
                  setState(() {
                    verifyCode = value;
                  });
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      width: 22,
                      height: 1,
                      color: const Color(0xff70737C).withOpacity(0.3),
                    ),
                  ],
                ),
                isCursorAnimationEnabled: false,
                defaultPinTheme: PinTheme(
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff70737C).withOpacity(0.22),
                    ),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                focusedPinTheme: PinTheme(
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    border: Border.all(
                      width: 1,
                      color: ColorTheme.of(context).primary.normal,
                    ),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
      isNext: verifyCode.length == 6,
      bottomButtonText: '다음으로',
      bottomButtonOnTap: () {
        setState(() {
          _isLoading = true;
        });

        context.read<AuthenticationBloc>().add(
              AuthenticationVerifyCode(verifyCode),
            );
      },
    );
  }
}
