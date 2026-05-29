import 'package:flutter/material.dart';


class FavoriteListItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback delete;
  const FavoriteListItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.delete
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: 1000,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.all(5.0),
            child:Text(title) ,),
            IconButton(onPressed: delete, icon: Icon(Icons.delete),),
          ],
        ),
      ),
    );
  }
}
