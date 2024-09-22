import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/firebase/event_model.dart';
import 'package:gap/gap.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  final title = TextEditingController();
  final desc = TextEditingController();
  final date = TextEditingController();
  final loc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add recipe",
              style: theme.textTheme.titleLarge!
                  .copyWith(color: theme.colorScheme.onSurface),
            ),
            const Gap(20),
            TextFormField(
              controller: title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: desc,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Discription",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: date,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Date",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: loc,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Location",
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addevent(context);
                },
                child: const Text("Add Event"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addevent(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection("events")
          .doc()
          .set(EventModel(
                  title: title.text,
                  desc: desc.text,
                  date: date.text,
                  loc: loc.text)
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
      print(e.toString());
    }
  }
}
