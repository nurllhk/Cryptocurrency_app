import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view/home.dart';
import '../../view/news.dart';
import '../../view/search.dart';

class TabbarManager extends ChangeNotifier {
  List<Widget> pages = const [
    Home(),
    Search(),
    News(),
  ];

  int index = 0;

  void tabbarTransition(int value) {
    index = value;
    notifyListeners();
  }
}

final tabbarProvider =
    ChangeNotifierProvider<TabbarManager>((ref) => TabbarManager());
