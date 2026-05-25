import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wiki_reader/root_screen.dart';
import 'package:wiki_reader/ui/article_page/article_screen.dart';
import 'package:wiki_reader/ui/favorite/favorite_item_cubit.dart';
import 'package:wiki_reader/ui/favorite/favorite_screen.dart';
import 'package:wiki_reader/ui/favorite/favorite_view.dart';
import 'package:wiki_reader/article_hive_box.dart';

final router = GoRouter(initialLocation: "/random",
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => RootScreen(navigationShell: navigationShell),
      branches:[
        StatefulShellBranch(
          routes:[
            GoRoute(
              path:"/random",
              builder: (context, state) => ArticleScreen()
            ),
          ],
        ),
        StatefulShellBranch(
          routes:[
            GoRoute(
              path:"/fav",
              builder: (_,_,child) => BlocProvider(
                context: (_) => FavItemCubit(),
                child: child
              ),
              routes: [
                GoRoute(
                  path: " ",
                  builder: (_, _) => FavScreen()
                ),
                GoRoute(
                  path: "item",
                  builder: (_, _) => Text("FavItem")
                )
              ]
            ),
          ],
        ),
      ],
    ),
  ],
);