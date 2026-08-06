
// flutter pub get
// git add .
// git commit -m "Update README"
// git push origin main

import 'package:final_project/sign_in/view.dart';
import 'package:final_project/widgets/interactive.dart';
import 'package:final_project/widgets/navigator_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_project/profile/view.dart';
import 'package:final_project/sign_up/view.dart';
import 'package:flutter/material.dart';
import 'auth_gate/view.dart';
import 'firebase_options.dart';
import 'Home/view.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AuthGate(),
    );
  }
}