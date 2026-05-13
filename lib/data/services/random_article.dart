import 'package:http/http.dart';
import 'package:dio/dio.dart';

class RandomArticleService {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> fetchRandomArticle() async {
    final uri = Uri.https(
      'ru.wikipedia.org',
      'api/rest_v1/page/random/summary',
    );
    try {
      final res = await _dio.get(uri.toString());
      return res.data;
    } on DioException catch (e) {
      throw(e);
    }
  }
}
