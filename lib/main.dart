import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_reader/ui/random_article/cubits/random_article.dart';
import 'summary.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:wiki_reader/data/repositories/random_article_repository.dart';
import 'package:wiki_reader/ui/random_article/cubits/random_article.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ArticleView());
  }
}

class ArticleModel {
  Future<Summary> getRandomArticle() async {
    final uri = Uri.https(
      'ru.wikipedia.org',
      'api/rest_v1/page/random/summary',
    );
    final response = await get(uri);
    if (response.statusCode != 200) {
      throw HttpException("Failed to update resource");
    }
    return Summary.fromJson(json.decode(response.body) as Map<String, Object?>);
  }
}

class ArticleViewModel extends ChangeNotifier {
  final RandomArticleRepository model;
  Summary? summary;
  Exception? error;
  bool isLoading = false;
  ArticleViewModel(this.model) {
    fetchArticle();
  }
  void fetchArticle() async {
    isLoading = true;
    notifyListeners();
    try {
      summary = await model.getRandomArticle();
      error = null;
    } on HttpException catch (e) {
      summary = null;
      error = e;
    }
    isLoading = false;
    notifyListeners();
  }
}

class ArticleWidget extends StatelessWidget {
  final Summary summary;
  const ArticleWidget({super.key, required this.summary});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        spacing: 10,
        children: [
          if (summary.hasImage) Image.network(summary.originalImage!.source),
          Text(
            summary.titles.normalized,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          if (summary.description != null)
            Text(
              summary.description!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          Text(summary.extract),
        ],
      ),
    );
  }
}

class ArticlePage extends StatelessWidget {
  final Summary summary;
  final VoidCallback nextArticle;
  ArticlePage({super.key, required this.summary, required this.nextArticle});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ArticleWidget(summary: summary),
          //ElevatedButton(onPressed: nextArticle, child: Text("Next Article")),
        ],
      ),
    );
  }
}

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          return switch (state) {
            ArticleLoading() => CircularProgressIndicator(),
            ArticleError(error: var e) => Text('Error$e'),
            ArticleLoaded(summary: var s) => ArticlePage(
              summary: s,
              nextArticle: context.read<ArticleCubit>().updateArticle,
            ),
            ArticleInitial() => Text('initial'),
            _ => Text('Something is wrong'),
          };
        },
      ),
    );
  }
}

