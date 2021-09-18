import 'package:cryptocu_app/src/models/newsCrypto_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class MarketCrypto extends StatelessWidget {
  final List<NewsCrypto> markets;
  const MarketCrypto({
    Key? key,
    required this.markets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Container(
      margin: const EdgeInsets.only(top: 5),
      // width: 390,
      height: 380,
      width: 450,
      // color: Colors.red,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 5, right: 10),
        physics: const BouncingScrollPhysics(),
        itemCount: markets.length.bitLength,
        itemBuilder: (BuildContext context, int index) {
          return CoinsMarket(
            markets: markets[index],
          );
        },
      ),
    );
  }
}

class CoinsMarket extends StatelessWidget {
  final NewsCrypto markets;
  // final int index;
  const CoinsMarket({
    Key? key,
    required this.markets,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      // width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.black12,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BoxCoins(
            index: 10,
            markets: markets,
          ),
        ],
      ),
    );
  }
}

class _BoxCoins extends StatelessWidget {
  final int index;
  final NewsCrypto markets;
  const _BoxCoins({
    Key? key,
    required this.markets,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Images(markets: markets),
          _Names(
            markets: markets,
          ),
          _Price(
            markets: markets,
          ),
        ],
      ),
    );
  }
}

class _Images extends StatelessWidget {
  const _Images({
    Key? key,
    required this.markets,
  }) : super(key: key);

  final NewsCrypto markets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: FadeInImage(
        height: 60,
        placeholder: const AssetImage('assets/loading2.gif'),
        image: NetworkImage(markets.image),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final NewsCrypto markets;
  const _Price({
    Key? key,
    required this.markets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'USD ${markets.currentPrice}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            textAlign: TextAlign.justify,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          (markets.priceChange24H > 1)
              ? Text(
                  'USD ${markets.priceChange24H}',
                  style: const TextStyle(
                      fontSize: 11,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                )
              : Text(
                  'USD -${markets.priceChange24H}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}

class _Names extends StatelessWidget {
  final NewsCrypto markets;

  const _Names({
    Key? key,
    required this.markets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          markets.name,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          markets.symbol.toUpperCase(),
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
