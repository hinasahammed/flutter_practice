import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/firebase/employee_model.dart';
import 'package:gap/gap.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  final name = TextEditingController();
  final position = TextEditingController();
  final salary = TextEditingController();
  final dep = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add employee",
              style: theme.textTheme.titleLarge!
                  .copyWith(color: theme.colorScheme.onSurface),
            ),
            const Gap(20),
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: position,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Position",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: salary,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Salary",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: dep,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Department",
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addemployees(context);
                },
                child: const Text("Add Employee"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addemployees(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection("employees")
          .doc()
          .set(EmployeeModel(
                  name: name.text,
                  posi: position.text,
                  salary: salary.text,
                  dep: dep.text)
              .toMap())
          .then(
        (value) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Added successfully"),
              ),
            );
          }
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
