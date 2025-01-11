import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Mentor extends Equatable {
  final String name;
  final Color primaryColor;
  final Color? secondaryColor;
  final String assetName;

  const Mentor({
    required this.name,
    required this.primaryColor,
    this.secondaryColor,
    required this.assetName,
  });

  @override
  List<Object?> get props => [name, primaryColor, secondaryColor, assetName];
}
