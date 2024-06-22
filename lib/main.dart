import 'package:flutter/material.dart';
import 'package:inherited_state_management/inherited_controller/inheritedcontroller.dart';
import 'package:inherited_state_management/models/usermodel.dart';
import 'package:inherited_state_management/pages/homepage.dart';

void main() {
  runApp(
      InheritedState(
         user: User(
            name: "chamod", email: "uchamod@52gamil.com", password: "1234"),
        child: const MyApp(),
       
      ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "inherited widget satate management example",
      home: HomePage(),
    );
  }
}
