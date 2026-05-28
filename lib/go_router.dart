import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wiki_reader/root_screen.dart';
import 'package:wiki_reader/ui/article_page/article_screen.dart';
import 'package:wiki_reader/ui/favorite/favorite_item_cubit.dart';
import 'package:wiki_reader/ui/favorite/favorite_item_screen.dart';
import 'package:wiki_reader/ui/favorite/favorite_screen.dart';

import 'package:go_provider/go_provider.dart';


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
            GoProviderRoute(
              path:"/fav",
              builder: (_, _) => FavScreen(),
               providers:(_,_) =>[
                BlocProvider(create:(_) => FavItemCubit(),
                )
              ],  
              routes: [
                GoRoute(
                  path: "item",
                  builder: (_, _) => const FavItemScreen()
                )
              ],
            )
          ],
        ),
      ],
    ),
  ],
);