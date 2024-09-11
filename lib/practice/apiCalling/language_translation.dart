import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice/model/languages_model/language.dart'; // Assuming correct path

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {
  List<Language> allLanguages = [];
  Language? selectedLanguage;
  final yourLanguageController = TextEditingController();
  final translatedLanguageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAlllanguages();
    translateLanguage();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language translation"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your language",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(20),
            DropdownButtonFormField<Language>(
              value: selectedLanguage,
              hint: const Text("Select a language"),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: allLanguages.map((language) {
                return DropdownMenuItem<Language>(
                  value: language,
                  child: Text(language.name ?? 'Unknown'),
                );
              }).toList(),
              onChanged: (Language? newLanguage) {
                setState(() {
                  selectedLanguage = newLanguage;
                });
              },
            ),
            const Gap(20),
            TextField(
              controller: yourLanguageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter your text here",
              ),
              maxLines: 6,
            ),
            const Gap(20),
            Text(
              "Translated language",
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Gap(20),
            DropdownButtonFormField<Language>(
              value: selectedLanguage,
              hint: const Text("Select a language"),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: allLanguages.map((language) {
                return DropdownMenuItem<Language>(
                  value: language,
                  child: Text(language.name ?? 'Unknown'),
                );
              }).toList(),
              onChanged: (Language? newLanguage) {
                setState(() {
                  selectedLanguage = newLanguage;
                });
              },
            ),
            const Gap(20),
            TextField(
              controller: yourLanguageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter your text here",
              ),
              maxLines: 6,
            ),
          ],
        ),
      ),
    );
  }

  Future fetchAlllanguages() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://deep-translate1.p.rapidapi.com/language/translate/v2/languages",
        ),
        headers: {
          "x-rapidapi-host": "deep-translate1.p.rapidapi.com",
          "x-rapidapi-key":
              "b65e9e1178msh7661c663c46802cp15188djsnc3290d348d6c",
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          for (var i in jsonDecode(response.body)['languages']) {
            allLanguages
                .add(Language.fromJson(i)); // Add each language to the list
          }
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future translateLanguage() async {
    try {
      print("Working");
      final response = await http.post(
        Uri.parse(
            "https://deep-translate1.p.rapidapi.com/language/translate/v2"),
        headers: {
          'Content-Type': 'application/json',
          "x-rapidapi-host": "deep-translate1.p.rapidapi.com",
          "x-rapidapi-key":
              "b65e9e1178msh7661c663c46802cp15188djsnc3290d348d6c",
        },
        body: {
          "q": "hu!",
          "source": "en",
          "target": "es",
        },
      );
      print(response.body);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
