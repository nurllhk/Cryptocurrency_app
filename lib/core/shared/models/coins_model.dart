
import 'dart:convert';

Coins coinsFromJson(String str) => Coins.fromJson(json.decode(str));

String coinsToJson(Coins data) => json.encode(data.toJson());

class Coins {
  final List<Datum> data;
  final int timestamp;

  Coins({
    required this.data,
    required this.timestamp,
  });

  Coins copyWith({
    List<Datum>? data,
    int? timestamp,
  }) =>
      Coins(
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory Coins.fromJson(Map<String, dynamic> json) => Coins(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "timestamp": timestamp,
  };
}

class Datum {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final dynamic supply;
  final dynamic maxSupply;
  final dynamic marketCapUsd;
  final dynamic volumeUsd24Hr;
  final dynamic priceUsd;
  final dynamic changePercent24Hr;
  final dynamic vwap24Hr;
  final dynamic explorer;

  Datum({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vwap24Hr,
    required this.explorer,
  });

  Datum copyWith({
    String? id,
    String? rank,
    String? symbol,
    String? name,
    String? supply,
    String? maxSupply,
    String? marketCapUsd,
    String? volumeUsd24Hr,
    String? priceUsd,
    String? changePercent24Hr,
    String? vwap24Hr,
    String? explorer,
  }) =>
      Datum(
        id: id ?? this.id,
        rank: rank ?? this.rank,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        supply: supply ?? this.supply,
        maxSupply: maxSupply ?? this.maxSupply,
        marketCapUsd: marketCapUsd ?? this.marketCapUsd,
        volumeUsd24Hr: volumeUsd24Hr ?? this.volumeUsd24Hr,
        priceUsd: priceUsd ?? this.priceUsd,
        changePercent24Hr: changePercent24Hr ?? this.changePercent24Hr,
        vwap24Hr: vwap24Hr ?? this.vwap24Hr,
        explorer: explorer ?? this.explorer,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    rank: json["rank"],
    symbol: json["symbol"],
    name: json["name"],
    supply: json["supply"],
    maxSupply: json["maxSupply"],
    marketCapUsd: json["marketCapUsd"],
    volumeUsd24Hr: json["volumeUsd24Hr"],
    priceUsd: json["priceUsd"],
    changePercent24Hr: json["changePercent24Hr"],
    vwap24Hr: json["vwap24Hr"],
    explorer: json["explorer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rank": rank,
    "symbol": symbol,
    "name": name,
    "supply": supply,
    "maxSupply": maxSupply,
    "marketCapUsd": marketCapUsd,
    "volumeUsd24Hr": volumeUsd24Hr,
    "priceUsd": priceUsd,
    "changePercent24Hr": changePercent24Hr,
    "vwap24Hr": vwap24Hr,
    "explorer": explorer,
  };
}
