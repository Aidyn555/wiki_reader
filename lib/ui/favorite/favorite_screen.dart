import 'package:flutter/material.dart';
import 'package:wiki_reader/summary_hive_box.dart';
import 'package:wiki_reader/ui/article_page/article_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.summaries});
  final List<Article> summaries;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var s in summaries) ArticleWidget(titles: s.titles, imageSource: s.imageSource, description: s.description)
        ]
      ),
    );
  }
}
