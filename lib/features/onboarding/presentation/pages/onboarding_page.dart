import 'package:flutter/material.dart';
import 'package:hackerton_gdg/features/character/presentation/pages/counsel_character_page.dart';
import 'package:hackerton_gdg/features/character/presentation/pages/select_character_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OnboardingPage());
  }

  @override
  Widget build(BuildContext context) {
    return const CounselCharacterPage();
  }
}
