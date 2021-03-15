import 'package:citizen_app/screens/main_screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Citizen Buddy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),



    );
  }
}
