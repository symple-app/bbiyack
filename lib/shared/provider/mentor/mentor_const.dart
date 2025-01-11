import 'package:flutter/material.dart';
import 'package:hackerton_gdg/shared/models/mentor_model.dart';

// ignore: non_constant_identifier_names
List<Mentor> MENTOR_LIST_DATA = [
  Mentor(
    name: '꼭끼오',
    primaryColor: Color(0xffFFB100),
    backgroundColor: Color(0xffDBDCDF),
    textColor: Color(0xFF171719),
    cardAsset: 'one',
    characterAsset: 'assets/new/character/one_ggio.png',
    summaryText: '오늘은 무슨 일이 있었니?\n구체적으로 말해봐~',
  ),
  Mentor(
    name: '듀끼오',
    primaryColor: Color(0xff12680F),
    secondaryColor: Color(0xff75F570),
    backgroundColor: Color(0xff12680F),
    cardAsset: 'du',
    characterAsset: 'assets/new/character/du_ggio.png',
    summaryText: '오늘은 또 무슨일이야\n다 말해봐.',
  ),
  Mentor(
    name: '트끼오',
    primaryColor: Color(0xff000000),
    secondaryColor: Color(0xff77DBFC),
    backgroundColor: Color(0xff000000),
    cardAsset: 't',
    characterAsset: 'assets/new/character/t_ggio.png',
    summaryText: '야야야야야 빨~리 말해\n시간없어!!',
  ),
];
