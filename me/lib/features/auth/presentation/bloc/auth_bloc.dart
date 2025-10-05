import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:me/features/auth/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _auth = AuthService.instance;

  String? _email;
  String? _password;

  AuthBloc() : super(AuthInitialState()) {
    // When Email Pressed
    on<EmailSubmitted>((event, emit) {
      _email = event.email;
      emit(EnterPasswordState(_email!));
    });

    // When Password Pressed
    on<PasswordSubmitted>((event, emit) {
      _password = event.password;
      if (event.isSignUp) {
        emit(ConfirmPasswordState(_email!, event.password));
      } else {
        add(LoginRequested());
      }

      // When Confirm Password Pressed
      on<ConfirmPasswordSubmitted>((event, emit) {
        if (_password != event.password) {
          emit(ErrorState("Password Don't Match", state));
          return;
        }
        add(SignupRequested());
      });

      // Login Request
      on<LoginRequested>((event, emit) async {
        emit(LoadingState());
        try {
          await _auth.signIn(email: _email!, password: _password!);
          emit(AuthenticatedState(_auth.user!.uid));
        } on FirebaseAuthException catch (e) {
          emit(
            ErrorState(e.message ?? "Unknown Error", UnauthenticatedState()),
          );
        }
      });

      // on SignUp Request
      on<SignupRequested>((event, emit) async {
        emit(LoadingState());
        try {
          await _auth.createAccount(email: _email!, password: _password!);
        } on FirebaseAuthException catch (e) {
          emit(
            ErrorState(e.message ?? "Unknown Error", UnauthenticatedState()),
          );
        }
      });

      // on Logout
      on<LogoutRequested>((event, emit) async {
        await _auth.signOut();
        emit(UnauthenticatedState());
      });
    });
  }
}
