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

  final List<New> data;
  final int count;
  final int page;

  factory NewsCryptoEvents.fromJson(Map<String, dynamic> json) =>
      NewsCryptoEvents(
        data: List<New>.from(json["data"].map((x) => New.fromJson(x))),
        count: json["count"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "count": count,
        "page": page,
      };
}

class New {
  New({
    required this.type,
    required this.title,
    required this.description,
    required this.organizer,
    required this.startDate,
    required this.website,
    required this.email,
    required this.venue,
    required this.address,
    required this.city,
    required this.country,
    this.screenshot,
  });

  final String type;
  final String title;
  final String description;
  final String organizer;
  final DateTime startDate;

  final String website;
  final String email;
  final String venue;
  final String address;
  final String city;
  final String country;
  final String? screenshot;

  get fullPosterImg {
    if (screenshot != null) {
      return 'https://assets.coingecko.com/events/screenshot/517/original/$screenshot';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory New.fromJson(Map<String, dynamic> json) => New(
        type: json["type"],
        title: json["title"],
        description: json["description"],
        organizer: json["organizer"],
        startDate: DateTime.parse(json["start_date"]),
        website: json["website"],
        email: json["email"],
        venue: json["venue"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        screenshot: json["screenshot"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "description": description,
        "organizer": organizer,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "website": website,
        "email": email,
        "venue": venue,
        "address": address,
        "city": city,
        "country": country,
        "screenshot": screenshot,
      };
}
