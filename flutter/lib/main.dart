import 'package:cancer_blood/Screens/login_screen.dart';
import 'package:cancer_blood/firebase_options.dart';
import 'package:cancer_blood/Screens/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cancer Blood',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      home: FirebaseAuth.instance.currentUser != null
          ? const Navigation()
          : LoginScreen(),
    );
  }
}
