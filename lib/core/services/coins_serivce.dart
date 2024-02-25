import 'dart:convert';

import 'package:http/http.dart' as http;

import '../providers/base_url.dart';
import '../shared/models/coins_model.dart';

class CoinSerivce {
  Future<Coins> fetchCoins() async {
    final response = await http.get(
      Uri.parse(BaseUrl.coinsUrl),
    );

    if (response.statusCode == 200) {
      return coinsFromJson(response.body);
    } else {
      throw Exception("Error : ${response.statusCode}");
    }
  }
}
