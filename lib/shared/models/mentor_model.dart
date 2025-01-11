import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Mentor extends Equatable {
  final String name;
  final Color primaryColor;
  final Color? secondaryColor;
  final Color backgroundColor;
  final Color? textColor;
  final String cardAsset;
  final String characterAsset;
  final String summaryText;

  const Mentor({
    required this.name,
    required this.primaryColor,
    this.secondaryColor,
    required this.backgroundColor,
    this.textColor,
    required this.cardAsset,
    required this.characterAsset,
    required this.summaryText,
  });

  @override
  List<Object?> get props => [
        name,
        primaryColor,
        secondaryColor,
      ];
}
