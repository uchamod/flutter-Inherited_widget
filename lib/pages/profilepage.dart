import 'package:flutter/material.dart';
import 'package:inherited_state_management/inherited_controller/inheritedcontroller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "usrename"),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "email"),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "pasword"),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  InheritedState.of(context).updatedUser(
                      email: email, name: username, password: password);
                  Navigator.pop(context);
                },
                child: const Text("Update"))
          ],
        ),
      ),
    );
  }
}
