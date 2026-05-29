import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_reader/ui/article_page/article_widget.dart';
import 'package:wiki_reader/ui/favorite/favorite_item_cubit.dart';

class FavItemScreen extends StatelessWidget {
  const FavItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavItemCubit, FavItemState>(
      builder:(context, state) {
        return switch (state){
          FavItemChosen(article: var a) => SingleChildScrollView(child: ArticleWidget(
            titles: a.titles,
            description: a.description,
            imageSource: a.imageSource,
            extract: a.extract,
            ),
          ),
          _ => Text("Something went wrong")
        };
      }
    );
  }
}
