part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

// Event for login
class LoginRequest extends AuthEvent {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

// Event for creating account
class CreateAccountRequest extends AuthEvent {
  final String email;
  final String password;

  const CreateAccountRequest({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

// on email pressed
class EmailEntered extends AuthEvent {
  final String email;
  const EmailEntered({required this.email});

  @override
  List<Object?> get props => [email];
}

// on password press
class PasswordEntered extends AuthEvent {
  final String password;
  const PasswordEntered({required this.password});

  @override
  List<Object?> get props => [password];
}

// on confirm password press
class ConfirmPasswordEntered extends AuthEvent {
  final String password;
  const ConfirmPasswordEntered({required this.password});

  @override
  List<Object?> get props => [password];
}

// on Logout Request
class LogOutRequest extends AuthEvent {
  const LogOutRequest();
}

// on Changing/setting Username
class ChangeUsername extends AuthEvent {
  final String username;

  const ChangeUsername({required this.username});

  @override
  List<Object?> get props => [username];
}

// Change Password Request
class ChangePasswordRequest extends AuthEvent {
  final String password;

  const ChangePasswordRequest({required this.password});

  @override
  List<Object?> get props => [password];
}
