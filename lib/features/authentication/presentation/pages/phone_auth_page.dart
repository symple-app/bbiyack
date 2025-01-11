import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackerton_gdg/features/authentication/blocs/authentication.bloc.dart';
import 'package:hackerton_gdg/features/authentication/models/authentication.model.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/sign_up_scaffold.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/text_field.dart';
import 'package:hackerton_gdg/shared/utils/phone_number_util.dart';

enum RegisterType { signup, login }

class PhoneAuthPage extends StatefulWidget {
  final RegisterType type;

  const PhoneAuthPage({super.key, required this.type});

  static Route<void> route({RegisterType? type}) {
    return MaterialPageRoute(
      builder: (_) => PhoneAuthPage(
        type: type ?? RegisterType.signup,
      ),
    );
  }

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  bool _isLoading = false;
  String phoneNumber = "";

  String title = "";
  String? subTitle;

  @override
  void didChangeDependencies() {
    setState(() {
      switch (widget.type) {
        case RegisterType.login:
          title = "휴대폰 번호를 입력해주세요";
          break;

        case RegisterType.signup:
          title = "전화번호만\n입력하면 회원가입 끝!";
          subTitle = "휴대폰 번호를 입력해주세요";
          break;
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SignUpScaffold(
      title: title,
      subTitle: subTitle,
      body: [
        SignUpTextFormField(
          keyboardType: TextInputType.phone,
          hintText: "휴대폰 번호",
          maxLength: 13,
          inputFormatters: <TextInputFormatter>[
            PhoneNumberInputFormatter(),
          ],
          onChanged: (String value) async {
            setState(() {
              phoneNumber = value;
            });

            if (value.length == 13) {
              FocusScope.of(context).unfocus();
            }
          },
        ),
      ],
      isNext: phoneNumber.length == 13,
      isLoading: _isLoading,
      bottomButtonText: '다음으로',
      bottomButtonOnTap: () async {
        setState(() {
          _isLoading = true;
        });

        await Future.delayed(Duration.zero);

        String parsedPhoneNumber = convertPhoneNumber(phoneNumber);

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: parsedPhoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            debugPrint("Credential : $credential");
          },
          verificationFailed: (FirebaseAuthException e) {
            debugPrint("Error! : $e");
          },
          codeSent: (String verificationId, int? resendToken) {
            debugPrint("Verification  ID : $verificationId");

            context
                .read<AuthenticationBloc>()
                .add(AuthenticationVerificationId(verificationId));

            context.read<AuthenticationBloc>().add(
                  AuthenticationFieldChanged(
                    FieldType.phone,
                    phoneNumber,
                  ),
                );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            debugPrint(verificationId);
          },
        );

        setState(() {
          _isLoading = false;
        });
      },
    );
  }
}
