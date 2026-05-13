import 'package:wiki_reader/data/services/random_article.dart';
import 'package:wiki_reader/summary.dart';

class RandomArticleRepository {
  final RandomArticleService service = RandomArticleService();
  Summary getRandomArticle()  {
    final data = service.fetchRandomArticle();
    return Summary.fromJson(data);
  }
}
