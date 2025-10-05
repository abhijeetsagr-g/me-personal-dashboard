part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// App started (maybe check if user is logged in)
class AppStarted extends AuthEvent {}

/// User entered their email and tapped "Next"
class EmailSubmitted extends AuthEvent {
  final String email;
  const EmailSubmitted(this.email);

  @override
  List<Object?> get props => [email];
}

/// User entered password and tapped "Next" or "Login"
class PasswordSubmitted extends AuthEvent {
  final String password;
  final bool isSignUp;
  const PasswordSubmitted(this.password, this.isSignUp);

  @override
  List<Object?> get props => [password];
}

/// User entered confirm password (signup only)
class ConfirmPasswordSubmitted extends AuthEvent {
  final String password;
  const ConfirmPasswordSubmitted(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginRequested extends AuthEvent {}

class SignupRequested extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
