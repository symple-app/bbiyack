import 'dart:convert';

import 'package:equatable/equatable.dart';

class SympleUser extends Equatable {
  const SympleUser({
    required this.id,
    required this.uid,
    required this.nickname,
    required this.gender,
    required this.birthYear,
    required this.phoneNumber,
    required this.createdAt,
  });

  final int id;
  final String uid;
  final String nickname;
  final String gender;
  final String birthYear;
  final String phoneNumber;
  final String createdAt;

  @override
  List<Object> get props =>
      [id, uid, nickname, gender, birthYear, phoneNumber, createdAt];

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'gender': gender,
      'birthYear': birthYear,
      'phoneNumber': phoneNumber,
    };
  }

  factory SympleUser.fromMap(Map<String, dynamic> map) {
    return SympleUser(
      id: map['id'],
      uid: map['uid'],
      nickname: map['nickname'],
      gender: map['gender'],
      birthYear: map['birthYear'],
      phoneNumber: map['phoneNumber'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SympleUser.fromJson(String source) =>
      SympleUser.fromMap(json.decode(source));
}
