// ignore_for_file: file_names

import 'package:cryptocu_app/src/services/crypto_services.dart';
import 'package:cryptocu_app/src/widgets/banner_Crypto.dart';
import 'package:cryptocu_app/src/widgets/card_crypto.dart';
import 'package:cryptocu_app/src/widgets/titulo_crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coins = Provider.of<CryptoServices>(context).coins;
    final news = Provider.of<CryptoServices>(context).news;

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

      drawer: const Drawer(),

      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          BannerCrypto(news: news),
          const SizedBox(height: 7.0),
          const TituloCrypto(),
          CardCrpyto(coins: coins),
        ],
      ),
    );
  }
}
