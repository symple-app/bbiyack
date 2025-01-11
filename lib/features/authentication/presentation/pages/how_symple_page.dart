import 'package:flutter/material.dart';
import 'package:hackerton_gdg/features/authentication/presentation/widgets/sign_up_scaffold.dart';

class HowSymplePage extends StatefulWidget {
  const HowSymplePage({super.key});

  @override
  State<HowSymplePage> createState() => _HowSymplePageState();
}

class _HowSymplePageState extends State<HowSymplePage> {
  @override
  Widget build(BuildContext context) {
    return SignUpScaffold(
      title: "심플을\n어떻게 알게 되었나요?",
      body: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xff70737C).withOpacity(0.22),
            ),
          ),
          child: Container(),
        )
      ],
    );
  }
}
