import 'package:flutter/material.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:wiki_reader/ui/favorite/favorite_view.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FavoriteView(summaries: ArticleHiveBox.getAll(), onTap: (){});
  }
}
