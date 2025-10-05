part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial State
class InitialState extends AuthState {
  const InitialState();
}

// Loading State
class LoadingState extends AuthState {
  const LoadingState();
}

// Error State
class ErrorState extends AuthState {
  final String errorMessage;

  const ErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

// Authenticated State
class AuthenticatedState extends AuthState {
  final String userId;

  const AuthenticatedState({required this.userId});

  @override
  List<Object?> get props => [userId];
}

// Unauthenticated State
class UnAuthenticatedState extends AuthState {
  const UnAuthenticatedState();
}

// Enter Mail State (When User is Logging In)
class EnterMailState extends AuthState {
  const EnterMailState();
}

// Enter Password State (When User is Entering Password)
class EnterPasswordState extends AuthState {
  const EnterPasswordState();
}

// Comfirm Password State
class ConfirmPasswordState extends AuthState {
  const ConfirmPasswordState();
}

// Change Username State
class ChangeUsernameState extends AuthState {
  const ChangeUsernameState();
}

// Change Password State
class ChangePasswordState extends AuthState {
  const ChangePasswordState();
}
