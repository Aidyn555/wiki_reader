import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:wiki_reader/ui/article_page/article_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.summaries});
  final List<Article?> summaries;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box(articleHiveBox).listenable(),
        builder: (context, state, _) {
          final articles = Hive.box<Article>(articleHiveBox).values;
          return SingleChildScrollView(
            child: Column(
              children: [
                for (var a in articles) 
                  ArticleWidget(
                    titles: a.titles,
                    imageSource: a.imageSource,
                    description: a.description,
                    extract: a.extract
                  ),
                ],
              
            ),
          );
        },
      ),
    );
  }
}
