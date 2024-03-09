
import 'package:coinapp/core/providers/base_url.dart';
import 'package:coinapp/core/shared/models/news_model.dart';
import 'package:http/http.dart' as http;

Future<News> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        BaseUrl.newsUrl),
  );
  if (response.statusCode == 200) {
    return newsFromJson(response.body);
  } else {
    throw Exception('Failed to load news ${response.statusCode}');
  }
}
