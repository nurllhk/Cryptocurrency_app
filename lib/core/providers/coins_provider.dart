import 'dart:async';
import 'package:coinapp/core/services/coins_serivce.dart';
import 'package:coinapp/core/shared/models/coins_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coinsProvider = StreamProvider<Coins>((ref) {
 return Stream.periodic(const Duration(seconds: 2), (_) {
  return CoinSerivce().fetchCoins();
 }).asyncMap((event) => event);
});
