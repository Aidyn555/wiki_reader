import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:wiki_reader/ui/favorite/favorite_list_widget.dart';
import 'package:hive/hive.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key, required this.summaries, required this.box});
  final List<Article?> summaries;
  final Box<Article> box;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB87CFD),
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 44 + MediaQuery.of(context).padding.top,
        centerTitle: true,
        title: const Padding(padding: EdgeInsets.only(top: 12.0),
        child: Text("Favorites",
        style: TextStyle(fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,),),
            
        ),
        shape: const Border(bottom: BorderSide(
          color: Colors.white12,
          width: 0.5
        )),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, state, _) {
          return FavoriteListWidget(
            box: box
          );
        },
      ),
    );
  }
}
