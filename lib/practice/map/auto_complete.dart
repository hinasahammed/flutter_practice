import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_practice/model/place_list/place_list.dart';
import 'package:http/http.dart' as http;

class AutoComplete extends StatefulWidget {
  const AutoComplete({super.key});

  @override
  State<AutoComplete> createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  final searchController = TextEditingController();
  List<PlaceList> recommendedPlace = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                autoCompleteLoc(value);
              },
              decoration: const InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recommendedPlace.length,
                itemBuilder: (context, index) {
                  final data = recommendedPlace[index];
                  return Card(
                    child: ListTile(
                      title: Text(data.description ?? ''),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future autoCompleteLoc(String searchText) async {
    String url =
        "https://maps.gomaps.pro/maps/api/place/autocomplete/json?input=$searchText&key=AlzaSyWzkOlSI7w5C4rFWeFqQbuukzwbDu9FXwQ";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        recommendedPlace.clear();
        for (var i in data['predictions']) {
          recommendedPlace.add(PlaceList.fromJson(i));
        }
        setState(() {});
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
