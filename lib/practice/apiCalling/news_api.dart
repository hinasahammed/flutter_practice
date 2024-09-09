import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/model/articles_model/article.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class NewsApi extends StatefulWidget {
  const NewsApi({super.key});

  @override
  State<NewsApi> createState() => _NewsApiState();
}

class _NewsApiState extends State<NewsApi> {
  List<Article> articles = [];
  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ghost news"),
      ),
      body: articles.isEmpty
          ? Center(
              child: Text(
                "No data found!",
                style: theme.textTheme.titleLarge!.copyWith(),
              ),
            )
          : ListView.separated(
              itemCount: 10,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) {
                final data = articles[index];
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data.urlToImage ?? ""),
                        fit: BoxFit.cover,
                        opacity: .2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          data.title ?? '',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Text(
                          data.description ?? '',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future fetchArticles() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2024-08-09&sortBy=publishedAt&apiKey=d6ffde51b27a48f487cae423dad906a9",
        ),
      );
      if (response.statusCode == 200) {
        setState(() {
          for (var i in jsonDecode(response.body)['articles']) {
            articles.add(Article.fromJson(i));
          }
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
