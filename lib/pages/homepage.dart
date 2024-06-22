import 'package:flutter/material.dart';
import 'package:inherited_state_management/inherited_controller/inheritedcontroller.dart';
import 'package:inherited_state_management/models/usermodel.dart';
import 'package:inherited_state_management/pages/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final User userdata = InheritedState.of(context).user;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "username: ${userdata.name}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
             Center(
              child: Text(
                "email: ${userdata.email}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                "password: ${userdata.password}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: const Text(
                  "go to profile page",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
