
import 'dart:convert';

Exchange exchangeFromJson(String str) => Exchange.fromJson(json.decode(str));

String exchangeToJson(Exchange data) => json.encode(data.toJson());

class Exchange {
  final List<Datum> data;
  final int timestamp;

  Exchange({
    required this.data,
    required this.timestamp,
  });

  Exchange copyWith({
    List<Datum>? data,
    int? timestamp,
  }) =>
      Exchange(
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "timestamp": timestamp,
  };
}

class Datum {
  final dynamic exchangeId;
  final dynamic name;
  final dynamic rank;
  final dynamic percentTotalVolume;
  final dynamic volumeUsd;
  final dynamic tradingPairs;
  final dynamic socket;
  final dynamic exchangeUrl;
  final dynamic updated;

  Datum({
    required this.exchangeId,
    required this.name,
    required this.rank,
    required this.percentTotalVolume,
    required this.volumeUsd,
    required this.tradingPairs,
    required this.socket,
    required this.exchangeUrl,
    required this.updated,
  });

  Datum copyWith({
    String? exchangeId,
    String? name,
    String? rank,
    String? percentTotalVolume,
    String? volumeUsd,
    String? tradingPairs,
    bool? socket,
    String? exchangeUrl,
    int? updated,
  }) =>
      Datum(
        exchangeId: exchangeId ?? this.exchangeId,
        name: name ?? this.name,
        rank: rank ?? this.rank,
        percentTotalVolume: percentTotalVolume ?? this.percentTotalVolume,
        volumeUsd: volumeUsd ?? this.volumeUsd,
        tradingPairs: tradingPairs ?? this.tradingPairs,
        socket: socket ?? this.socket,
        exchangeUrl: exchangeUrl ?? this.exchangeUrl,
        updated: updated ?? this.updated,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    exchangeId: json["exchangeId"],
    name: json["name"],
    rank: json["rank"],
    percentTotalVolume: json["percentTotalVolume"],
    volumeUsd: json["volumeUsd"],
    tradingPairs: json["tradingPairs"],
    socket: json["socket"],
    exchangeUrl: json["exchangeUrl"],
    updated: json["updated"],
  );

  Map<String, dynamic> toJson() => {
    "exchangeId": exchangeId,
    "name": name,
    "rank": rank,
    "percentTotalVolume": percentTotalVolume,
    "volumeUsd": volumeUsd,
    "tradingPairs": tradingPairs,
    "socket": socket,
    "exchangeUrl": exchangeUrl,
    "updated": updated,
  };
}
