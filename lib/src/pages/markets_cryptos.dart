// ignore_for_file: file_names

import 'package:cryptocu_app/src/models/models.dart';
import 'package:cryptocu_app/src/services/crypto_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MarketsCryptoPage extends StatelessWidget {
  // final List<NewsCrypto> markets;
  const MarketsCryptoPage({
    Key? key,
    // required this.markets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final markets = Provider.of<CryptoServices>(context).market;
    if (markets.isEmpty) {
      return const SizedBox(
        width: double.infinity,
        height: 220,
        child: Center(
          child: CircularProgressIndicator.adaptive(

              // backgroundColor: Colors.indigo,
              ),
        ),
      );
    }
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
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: markets.length,
        itemBuilder: (BuildContext context, int index) {
          return SafeArea(
            child: _Lista(
              markets: markets[index],
            ),
          );
        },
      ),
    );
  }
}

class _Lista extends StatelessWidget {
  final NewsCrypto markets;
  // final index = 1;
  const _Lista({
    Key? key,
    required this.markets,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, bottom: 10, left: 4),
      width: 200,
      // height: 130,
      // color: Colors.red,
      decoration: BoxDecoration(
        boxShadow: const [
          // BoxShadow(color: Colors.black12),
        ],
        // ignore: prefer_const_literals_to_create_immutables
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.e,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              markets.image,
              height: 40,
              width: 50,
            ),
          ),
          Text(
            '${markets.name} ',
            style: const TextStyle(fontSize: 14),
          ),
          Text(
            '(${markets.symbol})'.toUpperCase(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'USD ${markets.currentPrice}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    (markets.priceChangePercentage24H < 0)
                        ? const Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 30,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.arrow_drop_up_sharp,
                            size: 30,
                            color: Colors.green,
                          ),
                    (markets.priceChangePercentage24H < 0)
                        ? Text(
                            '${markets.priceChangePercentage24H}%',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11, color: Colors.red,
                              // fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            '${markets.priceChangePercentage24H}%',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11, color: Colors.green,
                              // fontWeight: FontWeight.bold,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
