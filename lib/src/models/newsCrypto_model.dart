// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore: file_names
// To parse this JSON data, do
//
//     final newsCrypto = newsCryptoFromJson(jsonString);

// ignore_for_file: unnecessary_new, prefer_if_null_operators, unnecessary_null_comparison, duplicate_ignore, file_names, prefer_null_aware_operators, prefer_conditional_assignment

import 'dart:convert';

List<NewsCrypto> newsCryptoFromJson(String str) =>
    List<NewsCrypto>.from(json.decode(str).map((x) => NewsCrypto.fromJson(x)));

String newsCryptoToJson(List<NewsCrypto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsCrypto {
  NewsCrypto({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    // required this.fullyDilutedValuation,
    // this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    // required this.totalSupply,
    // required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final int marketCap;
  final int marketCapRank;
  // final int fullyDilutedValuation;
  // final String? totalVolume;
  final double high24H;
  final double low24H;
  final double priceChange24H;
  final double priceChangePercentage24H;
  final double marketCapChange24H;
  final double marketCapChangePercentage24H;
  final double circulatingSupply;
  // final double totalSupply;
  // final double maxSupply;
  final double ath;
  final double athChangePercentage;
  final DateTime athDate;
  final double atl;
  final double atlChangePercentage;
  final DateTime atlDate;

  factory NewsCrypto.fromJson(Map<String, dynamic> json) => NewsCrypto(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        // totalVolume: json["total_volume"],
        high24H: json["high_24h"].toDouble(),
        low24H: json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
        circulatingSupply: json["circulating_supply"].toDouble(),
        ath: json["ath"].toDouble(),
        athChangePercentage: json["ath_change_percentage"].toDouble(),
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"].toDouble(),
        atlChangePercentage: json["atl_change_percentage"].toDouble(),
        atlDate: DateTime.parse(json["atl_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        // "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate.toIso8601String(),
      };
}
