import 'package:coinapp/core/shared/models/excahnge_model.dart';
import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  final Datum data;

  const ExchangePage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text(data.name)],
      ),
    );
  }
}
