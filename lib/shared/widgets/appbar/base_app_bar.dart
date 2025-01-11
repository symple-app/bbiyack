import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isMain;
  final bool isTransparent;
  final Color? backgroundColor;
  final bool canBack;
  final bool isLarge;
  final Function()? leadingOnTap;

  const BaseAppBar({
    super.key,
    this.title,
    this.isMain = false,
    this.isTransparent = false,
    this.backgroundColor,
    this.canBack = true,
    this.isLarge = false,
    this.leadingOnTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: isTransparent
          ? Colors.transparent
          : backgroundColor ??
              ColorTheme.of(context).background.normalAlternative,
      elevation: isTransparent ? 0 : null,
      foregroundColor: ColorTheme.of(context).inverse.background,
      title: title != null
          ? Text(
              title ?? '',
              style: isLarge
                  ? CustomTextStyle.of(
                      fontColor: ColorTheme.of(context).label.normal,
                    ).heading.mobile.xl
                  : CustomTextStyle.of(
                      fontColor: ColorTheme.of(context).label.normal,
                    ).title,
            )
          : null,
      leadingWidth: 48,
      leading: canBack && Navigator.canPop(context)
          ? InkWell(
              onTap: () {
                if (leadingOnTap != null) {
                  leadingOnTap!();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  'assets/new/icons/chevronLeft.svg',
                  colorFilter: ColorFilter.mode(
                    isTransparent
                        ? ColorTheme.of(context).static.white
                        : ColorTheme.of(context).static.black, // 원하는 색상으로 변경
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : null,
      centerTitle: false,
      titleSpacing: 20,
      toolbarHeight: 60,
      actions: [
        if (isMain) ...[
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/new/icons/bell-fill.svg",
                width: 24,
                height: 24,
              ),
            ),
          ),
          const SizedBox(width: 8)
        ]
      ],
      actionsIconTheme: IconThemeData(
        color: ColorTheme.of(context).static.white,
        size: 28,
      ),
    );
  }
}
