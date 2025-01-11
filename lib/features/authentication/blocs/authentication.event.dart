part of 'authentication.bloc.dart';

@immutable
sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AuthenticationSubscriptionRequested extends AuthenticationEvent {}

final class AuthenticationLogoutPressed extends AuthenticationEvent {}

final class AuthenticationFieldChanged extends AuthenticationEvent {
  final FieldType fieldType;
  final String value;

  const AuthenticationFieldChanged(
    this.fieldType,
    this.value,
  );
}

final class AuthenticationVerificationId extends AuthenticationEvent {
  final String verificationId;

  const AuthenticationVerificationId(this.verificationId);
}

final class AuthenticationVerifyCode extends AuthenticationEvent {
  final String code;

  const AuthenticationVerifyCode(this.code);
}

final class AuthenticationPressedNextButton extends AuthenticationEvent {}
