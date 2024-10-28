import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/chat/widgets/user_image_picker.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  File? _selectedImage;
  String downloadUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserImagePicker(
              onselectedImage: (image) {
                _selectedImage = image;
              },
            ),
            const Gap(10),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
              ),
            ),
            const Gap(10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
              ),
            ),
            const Gap(10),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            const Gap(20),
            ElevatedButton(
              onPressed: () async {
                await register();
                await uploadImage();
                await uploaddata();
              },
              child: const Text("Register"),
            ),
            Row(
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                  },
                  child: const Text("Login."),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future uploadImage() async {
    if (_selectedImage == null) {
      log("No image selected");
      return;
    }

    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child("upload/${DateTime.now().millisecondsSinceEpoch}.jpg");

      final uploadTask = await ref.putFile(_selectedImage!);

      final url = await uploadTask.ref.getDownloadURL();

      setState(() {
        downloadUrl = url;
      });
    } catch (e) {
      log("Error uploading image: $e");
    }
  }

  Future uploaddata() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .set({
      "username": _usernameController.text,
      "imageUrl": downloadUrl,
      "email": _emailController.text,
    });
  }

  Future register() async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
