import 'package:flutter/material.dart';
import 'package:wiki_reader/summary.dart';

class ArticleWidget extends StatelessWidget {
  //final Summary summary;
  final String titles;
  final String? imageSource;
  final String? description;
  const ArticleWidget({super.key, required this.titles, this.imageSource, this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        spacing: 10,
        children: [
          if (imageSource != null) Image.network(imageSource!),
          Text(
            titles,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          if (description != null)
            Text(
              description!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
        ],
      ),
    );
  }
}
