part of 'authentication.bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final AuthenticationUser user;
  final AuthenticationStep step;
  final String verificationId;
  final bool isLoading;

  @override
  List<Object> get props => [status, user, step];

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = AuthenticationUser.empty,
    this.step = AuthenticationStep.onboarding,
    this.verificationId = '',
    this.isLoading = false,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(AuthenticationUser user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  const AuthenticationState.unauthenticated(
      {AuthenticationStep onboardingStep = AuthenticationStep.onboarding,
      String verificationId = ''})
      : this._(
          status: AuthenticationStatus.unauthenticated,
          step: onboardingStep,
          verificationId: verificationId,
        );

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    AuthenticationUser? user,
    AuthenticationStep? step,
    String? verificationId,
  }) {
    return AuthenticationState._(
      status: status ?? this.status,
      user: user ?? this.user,
      step: step ?? this.step,
      verificationId: verificationId ?? this.verificationId,
    );
  }
}
