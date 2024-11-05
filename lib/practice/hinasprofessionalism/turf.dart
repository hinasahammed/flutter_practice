import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/hinasprofessionalism/turfview.dart';

class Turf extends StatefulWidget {
  const Turf({super.key});

  @override
  State<Turf> createState() => _TurfState();
}

class _TurfState extends State<Turf> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  )
                      .then(
                    (value) {
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TurfView(),
                          ));
                      }
                    },
                  );
                } catch (e) {
                  log(e.toString());
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
