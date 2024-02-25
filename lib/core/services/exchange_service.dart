
import 'package:coinapp/core/shared/models/excahnge_model.dart';
import 'package:http/http.dart' as http;

import '../providers/base_url.dart';

class ExchangeService {
  Future<Exchange> fetchExchange() async {
    final response = await http.get(Uri.parse(BaseUrl.exchangeUrl));
    if (response.statusCode == 200) {
      return exchangeFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
