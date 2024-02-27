import 'package:coinapp/core/providers/coins_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/coins_model.dart';
import '../theme/app_strings.dart';

class CoinView extends ConsumerStatefulWidget {
  final Datum data;

  const CoinView(this.data, {super.key});

  @override
  ConsumerState<CoinView> createState() => _LineChartSample2State();
}

late int price;

class _LineChartSample2State extends ConsumerState<CoinView> {
  List<Color> gradientColors = [
    Colors.blue,
    Colors.grey,
  ];

  int currentMonth = DateTime.now().month;
  List<String> allMonths = [
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık"
  ];

  @override
  Widget build(BuildContext context) {
    var history =
        ref.watch(coinHistoryProvider(widget.data.name.toLowerCase()));

    price = int.parse(widget.data.priceUsd.toString().substring(0, 2));
    return Scaffold(
      appBar: AppBar(),
      body: history.when(
          data: (historyData) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            "${Strings.iconName}${widget.data.symbol.toLowerCase()}@2x.png"),
                        title: Text(
                          widget.data.name.toString(),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        subtitle: Text(
                          widget.data.priceUsd.toString().substring(0, 10),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        trailing: Tooltip(
                            message: "News",
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.account_tree_rounded))),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.timelapse),
                              title: const Text("24 Saatlik Hacim"),
                              subtitle: Text(widget.data.volumeUsd24Hr
                                  .toString()
                                  .substring(0, 20)),
                            ),
                            ListTile(
                              leading:
                                  const Icon(Icons.shopping_basket_outlined),
                              title: const Text("Market Cup"),
                              subtitle: Text(widget.data.marketCapUsd
                                  .toString()
                                  .substring(0, 10)),
                            ),
                            ListTile(
                              leading: const Icon(Icons.compare_arrows),
                              title: const Text("Değişim Yüzdesi"),
                              subtitle: Text(widget.data.changePercent24Hr
                                  .toString()
                                  .substring(0, 5)),
                              trailing: Text(
                                widget.data.explorer,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.50,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 24,
                          bottom: 12,
                        ),
                        child: LineChart(
                          mainData(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 6,
                  child: ListView.builder(
                      itemCount: historyData.data.length,
                      itemBuilder: (context, index) {
                        return int.parse(historyData.data[index].date
                                    .toString()
                                    .substring(5, 7)) ==
                                currentMonth
                            ? ListTile(
                                title: Text(historyData.data[index].priceUsd
                                    .toString()
                                    .substring(0, 10)),
                                trailing: Text(int.parse(historyData
                                            .data[index].date
                                            .toString()
                                            .substring(5, 7)) ==
                                        currentMonth
                                    ? historyData.data[index].date
                                        .toString()
                                        .substring(0, 10)
                                    : " "),
                              )
                            : const ListTile();
                      }),
                )
              ],
            );
          },
          error: (err, stack) {
            return Center(
              child: Text("Error: $err"),
            );
          },
          loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              )),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text(whereMonth(currentMonth - 3), style: style);
        break;
      case 5:
        text = Text(whereMonth(currentMonth - 2), style: style);
        break;
      case 8:
        text = Text(whereMonth(currentMonth - 1), style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  String whereMonth(int value) {
    String text;
    switch (value) {
      case -3:
        text = allMonths[9];
        break;
      case -2:
        text = allMonths[10];
        break;
      case -1:
        text = allMonths[11];
        break;
      case 0:
        text = allMonths[0];
        break;
      default:
        text = allMonths[value];
        break;
    }
    return text;
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: price * 2,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, double.parse(price.toString().substring(0, 2))),
            FlSpot(6.8, double.parse(price.toString().substring(0, 2))),
            FlSpot(9.5, 3),
            FlSpot(11, double.parse(price.toString().substring(0, 2))),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
