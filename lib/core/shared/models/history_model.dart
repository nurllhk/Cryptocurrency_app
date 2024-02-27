
import 'dart:convert';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
  final List<Datum> data;
  final int timestamp;

  History({
    required this.data,
    required this.timestamp,
  });

  History copyWith({
    List<Datum>? data,
    int? timestamp,
  }) =>
      History(
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory History.fromJson(Map<String, dynamic> json) => History(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "timestamp": timestamp,
  };
}

class Datum {
  final String priceUsd;
  final int time;
  final DateTime date;

  Datum({
    required this.priceUsd,
    required this.time,
    required this.date,
  });

  Datum copyWith({
    String? priceUsd,
    int? time,
    DateTime? date,
  }) =>
      Datum(
        priceUsd: priceUsd ?? this.priceUsd,
        time: time ?? this.time,
        date: date ?? this.date,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    priceUsd: json["priceUsd"],
    time: json["time"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "priceUsd": priceUsd,
    "time": time,
    "date": date.toIso8601String(),
  };
}
