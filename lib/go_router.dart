import 'package:go_router/go_router.dart';
import 'package:wiki_reader/root_screen.dart';
import 'package:wiki_reader/ui/article_page/article_screen.dart';
import 'package:wiki_reader/ui/favorite/favorite_screen.dart';
import 'package:wiki_reader/summary_hive_box.dart';

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
              builder: (context, state) => FavoriteScreen(summaries: SummaryHiveBox.getAll())
            ),
          ],
        ),
      ],
    ),
  ],
);