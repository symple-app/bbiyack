import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/shared/widgets/appbar/base_app_bar.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ChartPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      body: Container(
        width: double.infinity,
        color: ColorTheme.of(context).background.normalAlternative,
        child: SingleChildScrollView(
          child: Expanded(
              child: Image.asset('assets/new/mock_chart.png',
                  fit: BoxFit.fitWidth)),
        ),
      ),
    );
  }
}
