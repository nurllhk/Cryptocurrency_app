
import 'package:coinapp/core/shared/theme/app_palet.dart';
import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Palet.pagePadding,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: Palet.singleRadius),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                hintText: "Hızlı Ara..."
              ),
            )
          ],
        ),
      ),
    );
  }
}
