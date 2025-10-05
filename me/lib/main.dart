import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:me/core/my_app.dart';
import 'package:me/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}
