import 'package:coinapp/core/providers/base_url.dart';
import 'package:coinapp/core/shared/models/history_model.dart';
import 'package:http/http.dart' as http;

class HistoryService {
  Future<History> getHistory(String value) async {
    // TODO example URL bitcoin/history?interval=d1

    final response = await http
        .get(Uri.parse("${BaseUrl.historyUrl}$value/history?interval=d1"));

    if (response.statusCode == 200) {
      return historyFromJson(response.body);
    } else {
      throw Exception("Error : ${response.statusCode}");
    }
  }
}
