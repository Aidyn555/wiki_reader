import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_reader/ui/random_article/cubits/random_article.dart';
import 'package:wiki_reader/ui/article_page/article_page.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text("Next Article"),
        onPressed: context.read<ArticleCubit>().updateArticle),
      body: BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        return switch (state) {
          ArticleLoading() => CircularProgressIndicator(),
          ArticleError(error: var e) => Text('Error $e'),
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
