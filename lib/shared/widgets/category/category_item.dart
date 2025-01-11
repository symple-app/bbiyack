// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hackerton_gdg/global/themes/color_palette.dart';
import 'package:hackerton_gdg/global/themes/text_style.dart';

enum CategoryType {
  DEPRESSION_RELIEF,
  DEPRESSION,
  ANXIETY,
  ADDICTION,
  STRESS,
  TRAUMA,
}

class CategoryItemModel {
  final String title;
  final Color color;

  CategoryItemModel(this.title, this.color);
}

class CategoryTypeMapper {
  static final Map<CategoryType, CategoryItemModel> _map = {
    CategoryType.DEPRESSION_RELIEF:
        CategoryItemModel('우울감 해소', ColorPalette.blue50),
    CategoryType.DEPRESSION: CategoryItemModel('우울감', ColorPalette.blue50),
    CategoryType.ANXIETY: CategoryItemModel('불안감', ColorPalette.redOrange50),
    CategoryType.ADDICTION: CategoryItemModel('중독', ColorPalette.purple50),
    CategoryType.STRESS: CategoryItemModel('스트레스', ColorPalette.violet50),
    CategoryType.TRAUMA: CategoryItemModel('트라우마', ColorPalette.red50),
  };

  static CategoryItemModel getCategoryItem(CategoryType state) {
    return _map[state]!;
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final Color fontColor;

  const CategoryItem({
    super.key,
    required this.title,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    // CategoryItemModel item = CategoryTypeMapper.getCategoryItem(type);

    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: fontColor,
            ),
          ),
          child: Center(
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: fontColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: CustomTextStyle.of(
            fontColor: fontColor,
          ).caption,
        ),
      ],
    );
  }
}
