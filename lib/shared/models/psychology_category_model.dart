import 'package:equatable/equatable.dart';

class PsychologyCategory extends Equatable {
  final String title;
  final String fontColor;
  final String? backgroundColor;
  final String createdAt;

  const PsychologyCategory({
    required this.title,
    required this.fontColor,
    this.backgroundColor,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        title,
        fontColor,
        backgroundColor,
        createdAt,
      ];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'fontColor': fontColor,
      'backgroundColor': backgroundColor,
      'createdAt': createdAt,
    };
  }

  factory PsychologyCategory.fromMap(Map<String, dynamic> map) {
    return PsychologyCategory(
      title: map['title'],
      fontColor: map['font_color'],
      backgroundColor: map['background_color'],
      createdAt: map['created_at'],
    );
  }
}
