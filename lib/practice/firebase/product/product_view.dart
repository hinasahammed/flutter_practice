import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/firebase/product_modal.dart';
import 'package:gap/gap.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final name = TextEditingController();
  final category = TextEditingController();
  final price = TextEditingController();
  final stock = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add product",
              style: theme.textTheme.titleLarge!
                  .copyWith(color: theme.colorScheme.onSurface),
            ),
            const Gap(20),
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Product name",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: category,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Category",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: price,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Price",
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: stock,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Stock",
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addProduct(context);
                },
                child: const Text("Add Product"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addProduct(BuildContext context) async {
    final firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection("products")
          .doc()
          .set(ProductModal(
                  name: name.text,
                  category: category.text,
                  price: price.text,
                  stock: stock.text)
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
