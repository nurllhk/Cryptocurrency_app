import 'package:coinapp/core/providers/coins_provider.dart';
import 'package:coinapp/core/shared/models/coins_model.dart';
import 'package:coinapp/core/shared/theme/app_palet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/shared/theme/app_strings.dart';
import '../core/shared/widgets/coin_view.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  bool _isSearch = false;
  TextEditingController searchController = TextEditingController();
  List<Datum> filteredCoins = [];
  List<Datum> coins = [];

  @override
  void initState() {
    super.initState();
    ref.read(coinsProvider).when(
      data: (coinData) {
        setState(() {
          coins = coinData.data;
        });
      },
      error: (err, stack) {
        throw Exception("$err");
      },
      loading: () {
        return const Center();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Palet.pagePadding,
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: Palet.singleRadius),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                      onPressed: () {
                        _isSearch = true;
                        setState(() {
                          String query = searchController.text.toLowerCase();
                          filteredCoins = coins
                              .where((coin) =>
                                  coin.name.toLowerCase().contains(query))
                              .toList();
                        });
                      },
                      icon: const Icon(Icons.search)),
                  hintText: "Hızlı Ara..."),
            ),
            Expanded(
                child: _isSearch
                    ? ref.watch(coinsProvider).when(
                        data: (coins) {
                          return ListView.builder(
                              itemCount: filteredCoins.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => CoinView(
                                                filteredCoins[index])));
                                  },
                                  leading: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      child: Image.network(
                                          "${Strings.iconName}${filteredCoins[index].symbol.toLowerCase()}@2x.png")),
                                  title: Text(
                                    filteredCoins[index].symbol,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(filteredCoins[index].name,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  trailing: Text(
                                    "\$${filteredCoins[index].priceUsd.substring(0, 9)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                );
                              });
                        },
                        error: (err, stack) {
                          return Center(
                            child: Text("$err"),
                          );
                        },
                        loading: () => const Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              ),
                            ))
                    : const Center())
          ],
        ),
      ),
    );
  }
}
