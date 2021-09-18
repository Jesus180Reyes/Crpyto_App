// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MarketsCryptoPage extends StatelessWidget {
  const MarketsCryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Markets Cryptos',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Market Cryptos'),
      ),
    );
  }
}
