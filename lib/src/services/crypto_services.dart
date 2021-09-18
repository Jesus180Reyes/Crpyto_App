// ignore_for_file: constant_identifier_names

import 'package:cryptocu_app/src/models/newsCryptoEvent.model.dart';
import 'package:cryptocu_app/src/models/newsCryptoTrending_model.dart';
import 'package:cryptocu_app/src/models/newsCrypto_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _url_trending = 'https://api.coingecko.com/api/v3';
const _url_news = 'https://api.coingecko.com/api/v3';
// const _url_markets = 'https://api.coingecko.com/api/v3';

class CryptoServices with ChangeNotifier {
  final List<Coin> coins = [];
  final List<New> news = [];
  final List<NewsCrypto> market = [];

  CryptoServices() {
    getTrendingCoins();
    getNewsCoins();
    getMarketsCoin();
  }

  getTrendingCoins() async {
    final url = Uri.parse('$_url_trending/search/trending');
    final resp = await http.get(url);
    final coinResponse = newsCryptoTrendingFromJson(resp.body);
    coins.addAll(coinResponse.coins);

    notifyListeners();
  }

  getNewsCoins() async {
    final url = Uri.parse('$_url_news/events');
    final resp = await http.get(url);
    final newsResponse = newsCryptoEventsFromJson(resp.body);
    news.addAll(newsResponse.data);
    notifyListeners();
  }

  getMarketsCoin() async {
    final url = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=100&page=1');
    final resp = await http.get(url);
    final newsResponse = newsCryptoFromJson(resp.body);
    market.addAll(newsResponse);
    notifyListeners();
  }
}
