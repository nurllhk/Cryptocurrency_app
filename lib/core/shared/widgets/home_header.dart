import 'package:coinapp/core/providers/exchange_provider.dart';
import 'package:coinapp/core/shared/theme/app_color.dart';
import 'package:coinapp/core/shared/theme/app_palet.dart';
import 'package:coinapp/core/shared/theme/app_strings.dart';
import 'package:coinapp/view/exchange.dart';
import 'package:coinapp/view/explorer_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    var exchange = ref.watch(exchangeProvider);
    return SizedBox(
      width: size.width,
      height: size.height / 2.5,
      child: Column(
        children: [
          Container(
            padding: Palet.pagePadding,
            width: size.width,
            height: size.height / 4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: Palet.pagePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hoş Geldiniz!",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Başlamak İçin Hazır Mısınız?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          )

                        ],
                      ),
                    ),
                    Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: size.width / 13,
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  margin: Palet.pagePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Borsalar",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return  ExchangePage(exchange);
                          }));
                        },
                        child: Text(
                          "Daha Fazla",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: PageColor.componentColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: size.width,
            height: size.height / 7,
            child: exchange.when(
                data: (exchange) {
                  return ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              GestureDetector(
                             onTap: (){

                               Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                 return Explorer(exchange.data[index].exchangeUrl);
                               }));

                             },
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: size.height/30,
                                  backgroundImage:
                                      AssetImage(Strings.images[index]),
                                ),

                              ),
                              Padding(
                                padding: Palet.pagePadding,
                                child: Text(
                                  exchange.data[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                error: (err, stack) {
                  return Center(
                    child: Text(
                      "Error: $err",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  );
                },
                loading: () => const Center()),
          )
        ],
      ),
    );
  }
}
