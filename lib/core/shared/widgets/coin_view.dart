import 'package:flutter/material.dart';

import '../models/coins_model.dart';

class CoinView extends StatelessWidget {
  final Datum data;

  const CoinView(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data.name)
        ],
      ),
    );
  }
}