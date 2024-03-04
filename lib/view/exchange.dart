import 'package:coinapp/core/shared/models/excahnge_model.dart';
import 'package:coinapp/view/explorer_coin.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/src/common.dart';

class ExchangePage extends StatelessWidget {
  final AsyncValue<Exchange> exchange;

  const ExchangePage(this.exchange, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: exchange.when(
          data: (exchangedata) {
            return ListView.builder(
                itemCount: exchangedata.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){

                        return Explorer(exchangedata.data[index].exchangeUrl);
                      }));
                    },
                    leading: Text(exchangedata.data[index].rank),
                    title: Text(exchangedata.data[index].name ?? ""),
                    subtitle: Text(
                        "${exchangedata.data[index].volumeUsd.toString().length > 10 ? exchangedata.data[index].volumeUsd.toString().substring(0, 10) : exchangedata.data[index].volumeUsd.toString()}\$"),
                  trailing: Text(exchangedata.data[index].volumeUsd.toString().split(".")[0]),);
                });
          },
          error: (err, stack) {},
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }
}
