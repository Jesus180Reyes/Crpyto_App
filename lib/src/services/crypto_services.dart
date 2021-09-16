// ignore_for_file: constant_identifier_names

import 'package:cryptocu_app/src/models/newsCryptoTrending_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _url_trending = 'https://api.coingecko.com/api/v3';

class CryptoServices with ChangeNotifier {
  List<Coin> coins = [];

  CryptoServices() {
    getTrendingCoins();
  }

  getTrendingCoins() async {
    final url = Uri.parse('$_url_trending/search/trending');
    final resp = await http.get(url);
    final coinResponse = newsCryptoTrendingFromJson(resp.body);
    coins.addAll(coinResponse.coins);

    notifyListeners();
  }
}
