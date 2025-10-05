import 'package:flutter/material.dart';
import 'package:me/features/auth/presentation/pages/auth_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Me!', home: AuthPage());
  }
}
