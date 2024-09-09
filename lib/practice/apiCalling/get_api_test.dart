import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/model/user/user.dart';
import 'package:http/http.dart' as http;

class GetApiTest extends StatefulWidget {
  const GetApiTest({super.key});

  @override
  State<GetApiTest> createState() => _GetApiTestState();
}

class _GetApiTestState extends State<GetApiTest> {
  List<User> data = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api calling"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            if (data.isEmpty) {
              return const Text("No data found");
            } else {
              return Card(
                child: ListTile(
                  title: Text(data[index].firstName! + data[index].lastName!),
                  subtitle: Text(data[index].email!),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatar!),
                  ),
                ),
              );
            }
          }),
    );
  }

  Future fetchData() async {
    try {
      final response = await http
          .get(
            Uri.parse("https://reqres.in/api/users?page=2"),
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        setState(() {
          for (var i in jsonDecode(response.body)["data"]) {
            data.add(User.fromJson(i));
          }
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
