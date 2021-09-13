// ignore_for_file: file_names

import 'package:cryptocu_app/src/widgets/banner_Crypto.dart';
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
        children: const [
          BannerCrypto(),
          SizedBox(height: 7.0),
        ],
      ),
    );
  }
}
