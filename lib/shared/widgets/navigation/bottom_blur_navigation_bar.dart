import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackerton_gdg/shared/widgets/navigation/bottom_navigation_manager.dart';
import 'package:hackerton_gdg/global/themes/color_theme.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

class BottomBlurNavigationBar extends StatelessWidget {
  final List<BottomNavigationManager> bottomNavigationItemList;
  final int selectedIndex;
  final Function(int)? onTap;

  const BottomBlurNavigationBar({
    super.key,
    required this.bottomNavigationItemList,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.05),
            width: 1,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,

          // default styles
          backgroundColor: ColorTheme.of(context).background.normalNormal,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,

          // selected options
          selectedItemColor: ColorTheme.of(context).primary.normal,
          selectedIconTheme: const IconThemeData(size: 24),
          selectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),

          // unselected options
          unselectedItemColor: ColorTheme.of(context).label.assistive,
          unselectedIconTheme: const IconThemeData(size: 24),
          unselectedLabelStyle: CustomTextStyle.of(
            fontWeight: FontWeight.w500,
          ).caption2,

          //items
          items: [
            ...bottomNavigationItemList.map(
              (item) {
                bool isSelected = item.index == selectedIndex;
                Color selectedColor = isSelected
                    ? ColorTheme.of(context).primary.normal
                    : ColorTheme.of(context).label.assistive;

                return BottomNavigationBarItem(
                  label: item.title,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: SvgPicture.asset(
                      item.imageAsset,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        selectedColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
