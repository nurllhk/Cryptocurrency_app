
import 'package:coinapp/core/services/news_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider = FutureProvider((ref) => fetchNews());