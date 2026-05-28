import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wiki_reader/ui/favorite/favorite_item_cubit.dart';
import 'package:wiki_reader/ui/favorite/favorite_list_item_widget.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:hive/hive.dart';

class FavoriteListWidget extends StatelessWidget {
  final Box<Article> box;
  const FavoriteListWidget({super.key, required this.box});
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          children: [
            for (var a in box.values)
              FavoriteListItemWidget(
                title: a.titles,
                onTap: () {
                  final c = context.read<FavItemCubit>();
                  context.go("/fav/item");
                  c.setFavItem(a);
                 
                },
              ),
          ],
        ),
      ),
    );
  }
}
