// ignore_for_file: file_names

import 'package:cryptocu_app/src/services/crypto_services.dart';
import 'package:cryptocu_app/src/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coins = Provider.of<CryptoServices>(context).coins;
    final news = Provider.of<CryptoServices>(context).news;
    final markets = Provider.of<CryptoServices>(context).market;

    return Scaffold(
      // drawerScrimColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Market',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              BannerCrypto(news: news),
              const SizedBox(height: 7.0),
              const TituloCrypto(
                seeall: '',
                titulo: 'Top Trending 24Hr',
                tap: 'all',
              ),
              CardCrpyto(coins: coins),
              const SizedBox(height: 7.0),
              const TituloCrypto(
                titulo: 'Markets Coins',
                seeall: 'See All',
                tap: 'markets',
                icon: Icons.arrow_forward_ios,
              ),
              MarketCrypto(
                markets: markets,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
