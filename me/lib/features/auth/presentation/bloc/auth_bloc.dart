import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:me/features/auth/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _auth = AuthService.instance;

  AuthBloc() : super(InitialState()) {
    // Login Request
    on<LoginRequest>(_onLoginRequest);

    // Create Account Request
  }

  Future<void> _onLoginRequest(
    LoginRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _auth.signIn(email: event.email, password: event.email);
      emit(AuthenticatedState(userId: _auth.user?.uid ?? "Unknown UID"));
    } on FirebaseAuthException catch (e) {
      emit(ErrorState(errorMessage: e.message ?? "Unknown Error"));
    }
  }

  Future<void> _onCreateAccountRequest(
    CreateAccountRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _auth.signIn(email: event.email, password: event.email);
      emit(AuthenticatedState(userId: _auth.user?.uid ?? "Unknown UID"));
    } on FirebaseAuthException catch (e) {
      emit(ErrorState(errorMessage: e.message ?? "Unknown Error"));
    }
  }
}
