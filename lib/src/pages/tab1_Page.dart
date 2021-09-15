// ignore_for_file: file_names

import 'package:cryptocu_app/src/widgets/banner_Crypto.dart';
import 'package:cryptocu_app/src/widgets/card_crypto.dart';
import 'package:cryptocu_app/src/widgets/titulo_crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab1Page extends StatelessWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Market',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // backgroundColor: Colors.red,
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const BannerCrypto(),
          const SizedBox(height: 7.0),
          const TituloCrypto(),
          const CardCrpyto(),
        ],
      ),
    );
  }
}
