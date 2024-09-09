import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/model/dog/dog.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class DogApiTest extends StatefulWidget {
  const DogApiTest({super.key});

  @override
  State<DogApiTest> createState() => _DogApiTestState();
}

class _DogApiTestState extends State<DogApiTest> {
  List<Dog> dogList = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog api"),
      ),
      body: dogList.isEmpty
          ? const Center(
              child: Text("No data found!"),
            )
          : ListView.separated(
              itemCount: dogList.length,
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    dogList[index].url ?? '',
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Future fetchData() async {
    try {
      final response = await http.get(
          Uri.parse("https://api.thecatapi.com/v1/images/search?limit=10"));
      if (response.statusCode == 200) {
        setState(() {
          for (var i in jsonDecode(response.body)) {
            dogList.add(Dog.fromJson(i));
          }
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
