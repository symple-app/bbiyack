import 'package:flutter/material.dart';
import 'package:hackerton_gdg/shared/models/mentor_model.dart';

class MentorProvider with ChangeNotifier {
  Mentor? _selectedMentor;
  final List<Mentor> _mentorList = [
    Mentor(
      name: '꼭끼오',
      primaryColor: Color(0xffFFB100),
      secondaryColor: Color(0xffFFB100),
      assetName: 'one',
    ),
    Mentor(
      name: '듀끼오',
      primaryColor: Color(0xff12680F),
      secondaryColor: Color(0xff12680F),
      assetName: 'du',
    ),
    Mentor(
      name: '트끼오',
      primaryColor: Color(0xff000000),
      secondaryColor: Color(0xff000000),
      assetName: 't',
    ),
  ];

  Mentor? get selectedMentor => _selectedMentor;
  List<Mentor> get mentorList => _mentorList;

  void selectMentor(Mentor mentor) {
    _selectedMentor = mentor;
  }
}
