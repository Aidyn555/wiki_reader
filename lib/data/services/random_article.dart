class RandomArticleService {
  Future<Map<String, dynamic>> fetchRandomArticle() async {
    final uri = Uri.https(
      'ru.wikipedia.org',
      'api/rest_v1/page/random/summary',
    );
    final response = await get(uri);
    if (response.statusCode != 200) {
      throw HttpException("Failed to update resource");
    }
    return Summary.fromJson(json.decode(response.body) as Map<String, Object?>);
  }
}
