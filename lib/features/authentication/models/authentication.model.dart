import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hackerton_gdg/shared/models/user_model.dart';

enum FieldType { nickname, genderAndBirthYear, phone }

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

enum AuthenticationStep {
  onboarding,
  nickname,
  genderAndBirthYear,
  phoneNumber,
  accessCode
}

class AuthenticationUser extends Equatable {
  final int id;
  final String? uid;
  final String? nickname;
  final String? gender;
  final String? birthYear;
  final String? phoneNumber;
  final int? trigger;

  const AuthenticationUser({
    required this.id,
    this.uid,
    this.nickname,
    this.gender,
    this.birthYear,
    this.phoneNumber,
    this.trigger,
  });

  @override
  List<Object?> get props =>
      [id, uid, nickname, gender, birthYear, phoneNumber, trigger];

  static const empty = AuthenticationUser(id: 0);

  AuthenticationUser copyWith({
    int? id,
    String? uid,
    String? nickname,
    String? gender,
    String? birthYear,
    String? phoneNumber,
    int? trigger,
  }) {
    return AuthenticationUser(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      birthYear: birthYear ?? this.birthYear,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      trigger: trigger ?? this.trigger,
    );
  }

  AuthenticationUser copyWithSympleUser(SympleUser sympleUser) {
    return AuthenticationUser(
      id: sympleUser.id,
      uid: sympleUser.uid,
      nickname: sympleUser.nickname,
      gender: sympleUser.gender,
      birthYear: sympleUser.birthYear,
      phoneNumber: sympleUser.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'nickname': nickname,
      'gender': gender,
      'birthYear': birthYear,
      'phoneNumber': phoneNumber,
    };
  }

  Map<String, dynamic> saveToMap() {
    return {
      'uid': uid,
      'nickname': nickname,
      'gender': gender,
      'birthYear': birthYear,
      'phoneNumber': phoneNumber,
    };
  }

  factory AuthenticationUser.fromMap(Map<String, dynamic> map) {
    return AuthenticationUser(
      id: map['id'],
      uid: map['uid'],
      nickname: map['nickname'],
      gender: map['gender'],
      birthYear: map['birthYear'],
      phoneNumber: map['phoneNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationUser.fromJson(String source) =>
      AuthenticationUser.fromMap(json.decode(source));

  bool hasNullFields() {
    return uid == null ||
        nickname == null ||
        gender == null ||
        birthYear == null ||
        phoneNumber == null;
  }
}
