part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class LoadingState extends AuthState {}

class EnterEmailState extends AuthState {}

class EnterPasswordState extends AuthState {
  final String email;
  const EnterPasswordState(this.email);

  @override
  List<Object?> get props => [email];
}

class ConfirmPasswordState extends AuthState {
  final String email;
  final String password;
  const ConfirmPasswordState(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class AuthenticatedState extends AuthState {
  final String userId;
  const AuthenticatedState(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UnauthenticatedState extends AuthState {}

class ErrorState extends AuthState {
  final String message;
  final AuthState prevState;
  const ErrorState(this.message, this.prevState);

  @override
  List<Object?> get props => [message];
}
