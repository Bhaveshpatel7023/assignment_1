import 'package:assignment_1/user_profile.dart';
import 'package:flutter/material.dart';

import 'edit_user.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen()
    );
  }
}


