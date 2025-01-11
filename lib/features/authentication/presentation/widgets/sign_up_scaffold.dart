import 'package:flutter/material.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/title.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/sign_up_app_bar.dart';
import 'package:hackerton_gdg/shared/widgets/button/bottom_button.dart';

class SignUpScaffold extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<Widget>? body;

  final Function()? bottomButtonOnTap;
  final String? bottomButtonText;
  final bool? isNext;
  final bool? isLoading;
  final ScrollController? controller;

  const SignUpScaffold({
    super.key,
    required this.title,
    this.controller,
    this.subTitle,
    this.body,
    this.bottomButtonText,
    this.bottomButtonOnTap,
    this.isNext,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const SignUpAppBar(),
        body: SingleChildScrollView(
          controller: controller,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SignUpTitle(
                    title: title,
                    subTitle: subTitle,
                  ),
                  const SizedBox(height: 36),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: body ?? [],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewPadding.bottom + 56,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: bottomButtonOnTap != null
            ? BottomButton(
                onTap: bottomButtonOnTap,
                title: bottomButtonText ?? '다음으로',
                isActive: isNext ?? true,
                isLoading: isLoading ?? false,
              )
            : null,
      ),
    );
  }
}
