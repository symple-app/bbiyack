import 'package:flutter/material.dart';
import 'package:hackerton_gdg/shared/models/mentor_model.dart';
import 'package:hackerton_gdg/shared/provider/mentor/mentor_const.dart';

class MentorProvider with ChangeNotifier {
  final List<Mentor> _mentorList = MENTOR_LIST_DATA;
  Mentor _selectedMentor = MENTOR_LIST_DATA[0];

  Mentor get selectedMentor => _selectedMentor;
  List<Mentor> get mentorList => _mentorList;

  void selectMentor(Mentor mentor) {
    _selectedMentor = mentor;
  }

  bool isMentorNameOne() {
    return _selectedMentor.cardAsset == 'one';
  }

  Color getProcessConnectRectBackgroundColor() {
    bool isAssetNameOne = _selectedMentor.cardAsset == 'one';

    if (isAssetNameOne) {
      return Colors.white;
    }

    return Color(0xff989BA2);
  }

  Color getProcessConnectRectActivateColor() {
    Color primaryColor = _selectedMentor.primaryColor;
    Color? secondaryColor = _selectedMentor.secondaryColor;

    return secondaryColor ?? primaryColor;
  }
}
