import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:wiki_reader/ui/favorite/favorite_list_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key, required this.summaries, required this.box});
  final List<Article?> summaries;
  final Box box;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, state, _) {
          return FavoriteListWidget(
            box: box,
          );
        },
      ),
    );
  }
}
