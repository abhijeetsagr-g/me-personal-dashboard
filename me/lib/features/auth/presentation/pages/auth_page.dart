import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:me/features/auth/presentation/view/auth_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: AuthView(),
    );
  }
}
