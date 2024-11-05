import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/firebase/book_model.dart';
import 'package:gap/gap.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final title = TextEditingController();
  final author = TextEditingController();
  final genre = TextEditingController();
  final isbn = TextEditingController();
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
              "Add book",
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
              controller: author,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Author",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: genre,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Genre",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: isbn,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "isbn",
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addbook(context);
                },
                child: const Text("Add Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addbook(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection("book")
          .doc()
          .set(BookModel(
                  title: title.text,
                  author: author.text,
                  genre: genre.text,
                  isbn: isbn.text)
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
