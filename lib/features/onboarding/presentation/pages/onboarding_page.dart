import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OnboardingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("a"),
      ),
    );
  }
}
