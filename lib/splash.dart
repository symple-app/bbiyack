import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const Splash());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset(
                  'assets/new/symple_icons/emotion_clover.svg',
                  width: 130,
                  height: 130,
                ),
              ),
            ),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
