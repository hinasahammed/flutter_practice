import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/firebase/movie_model.dart';
import 'package:gap/gap.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final title = TextEditingController();
  final director = TextEditingController();
  final release = TextEditingController();
  final rating = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add movie",
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
              controller: director,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Director",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: release,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Release year",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: rating,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Rating",
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addmovie(context);
                },
                child: const Text("Add Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addmovie(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection("movies")
          .doc()
          .set(MovieModel(
                  title: title.text,
                  director: director.text,
                  release: release.text,
                  rating: rating.text)
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
