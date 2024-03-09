import 'package:coinapp/core/providers/coins_provider.dart';
import 'package:coinapp/core/shared/theme/app_palet.dart';
import 'package:coinapp/core/shared/theme/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/shared/widgets/coin_view.dart';
import '../core/shared/widgets/home_header.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          const HomeHeader(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Palet.pageRadius, topRight: Palet.pageRadius)),
              child: ref.watch(coinsProvider).when(
                  data: (coins) => ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CoinView(coins.data[index])));
                          },
                          leading: Hero(
                            tag: "coin",
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 10,
                                child: Image.network(
                                    "${Strings.iconName}${coins.data[index].symbol.toLowerCase()}@2x.png")),
                          ),
                          title: Text(coins.data[index].symbol),
                          subtitle: Text(coins.data[index].name),
                          trailing: Text(
                            "\$${coins.data[index].priceUsd.substring(0, 9)}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        );
                      }),
                  error: (err, stack) {
                    return Center(
                      child: Text("Error: $err"),
                    );
                  },
                  loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
