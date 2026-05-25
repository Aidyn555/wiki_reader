import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_reader/article_hive_box.dart';

class FavItemState {}

class FavItemChosen extends FavItemState {
  final Article article;
  FavItemChosen({required this.article});
}

class FavItemInitial extends FavItemState {}

class FavItemCubit extends Cubit<FavItemCubit> {
  FavItemCubit() : super(FavItemInitial());
  void setFavItem(Article a) {
    final state = FavItemLoaded(article: a);
    emit(state);
  }
}
