import 'package:flutter/material.dart';
import 'package:wiki_reader/ui/favorite/favorite_list_item_widget.dart';

class FavoriteListWidget extends StatelessWidget {
  final Box<Article> box;
  const FavoriteListWidget({super.key, required this.box});
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [for (var a in box.values)
          FavoriteListItemWidget(
            title: a.titles,
            onTap: (){}
            )
          ],
        )
      ),
    );
  }
}
