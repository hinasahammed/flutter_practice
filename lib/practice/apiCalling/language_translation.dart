import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice/model/languages_model/language.dart'; 

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {
  List<Language> allLanguages = [];
  Language? selectedYourLanguage;
  Language? selectedtranslated;
  final yourLanguageController = TextEditingController();
  final translatedLanguageController = TextEditingController();
  String translatedText = '';

  @override
  void initState() {
    super.initState();
    fetchAlllanguages();
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
              value: selectedYourLanguage,
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
                  selectedYourLanguage = newLanguage;
                });
              },
            ),
            const Gap(20),
            DropdownButtonFormField<Language>(
              value: selectedtranslated,
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
                  selectedtranslated = newLanguage;
                });
              },
            ),
            const Gap(20),
            TextFormField(
              controller: yourLanguageController,
              onChanged: (value) {
                translateLanguage();
              },
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
            Card(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                height: 200,
                child: Text(
                  translatedText,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            const Gap(10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  translateLanguage();
                },
                child: const Text("Translate"),
              ),
            )
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
            allLanguages.add(Language.fromJson(i));
          }
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future translateLanguage() async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://deep-translate1.p.rapidapi.com/language/translate/v2"),
        headers: {
          'Content-Type': 'application/json',
          "x-rapidapi-host": "deep-translate1.p.rapidapi.com",
          "x-rapidapi-key":
              "b65e9e1178msh7661c663c46802cp15188djsnc3290d348d6c",
        },
        body: jsonEncode({
          "q": yourLanguageController.text,
          "source": selectedYourLanguage!.language,
          "target": selectedtranslated!.language,
        }),
      );
      var translated =
          jsonDecode(response.body)['data']['translations']['translatedText'];
      setState(() {
        translatedText = translated.toString();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
