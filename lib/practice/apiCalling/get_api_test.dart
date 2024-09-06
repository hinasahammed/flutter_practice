import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetApiTest extends StatefulWidget {
  const GetApiTest({super.key});

  @override
  State<GetApiTest> createState() => _GetApiTestState();
}

class _GetApiTestState extends State<GetApiTest> {
  List data = [];
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
                  title: Text(
                      data[index]['first_name'] + data[index]['last_name']),
                  subtitle: Text(data[index]['email']),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index]['avatar']),
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
          data = jsonDecode(response.body)["data"];
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
