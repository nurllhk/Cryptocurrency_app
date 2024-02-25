
import 'package:coinapp/core/services/exchange_service.dart';
import 'package:coinapp/core/shared/models/excahnge_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeProvider = FutureProvider<Exchange>((ref) => ExchangeService().fetchExchange());
