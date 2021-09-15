// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RecommendedCryptoPage extends StatelessWidget {
  const RecommendedCryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recommended Cryptos',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Recommended Cryptos'),
      ),
    );
  }
}
