import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class StepAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Function()? leadingOnTap;

  const StepAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.leadingOnTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorTheme.of(context).background.normalNormal,
      title: title != null
          ? Text(
              title ?? '',
              style: CustomTextStyle.of(
                fontColor: ColorTheme.of(context).label.normal,
              ).subTitle,
            )
          : null,
      leadingWidth: 48,
      leading: Navigator.canPop(context)
          ? InkWell(
              onTap: leadingOnTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  'assets/new/icons/chevronLeft.svg',
                  colorFilter: ColorFilter.mode(
                    ColorTheme.of(context).label.normal,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : null,
      centerTitle: centerTitle,
      titleSpacing: 20,
      toolbarHeight: 60,
      actions: actions,
      actionsIconTheme: IconThemeData(
        color: ColorTheme.of(context).static.white,
        size: 28,
      ),
    );
  }
}
