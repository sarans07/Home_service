
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:home_services_app/pages/SplashScreen.dart';

import 'package:get/get.dart';
import 'auth/firebase_options.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
