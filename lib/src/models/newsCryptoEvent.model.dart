// To parse this JSON data, do
//
//     final newsCryptoEvents = newsCryptoEventsFromJson(jsonString);

import 'dart:convert';

NewsCryptoEvents newsCryptoEventsFromJson(String str) =>
    NewsCryptoEvents.fromJson(json.decode(str));

String newsCryptoEventsToJson(NewsCryptoEvents data) =>
    json.encode(data.toJson());

class NewsCryptoEvents {
  NewsCryptoEvents({
    required this.data,
    required this.count,
    required this.page,
  });

  final List<Map<String, String>> data;
  final int count;
  final int page;

  factory NewsCryptoEvents.fromJson(Map<String, dynamic> json) =>
      NewsCryptoEvents(
        data: List<Map<String, String>>.from(json["data"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
        count: json["count"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "count": count,
        "page": page,
      };
}
