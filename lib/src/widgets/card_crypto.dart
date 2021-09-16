// ignore_for_file: prefer_const_constructors

import 'package:cryptocu_app/src/models/newsCryptoTrending_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCrpyto extends StatelessWidget {
  final List<Coin> coins;
  const CardCrpyto({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cryptoservices = Provider.of<CryptoServices>(context);

    return SizedBox(
      height: 150,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 12),
        itemCount: coins.length,
        itemBuilder: (BuildContext context, int index) {
          // return Text(coins[index].item.name);
          return OperationCard(
            coin: coins[index],
            index: index,
          );
        },
      ),
    );
  }
}

class OperationCard extends StatelessWidget {
  final Coin coin;
  final int index;

  const OperationCard({
    Key? key,
    required this.coin,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 150,
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
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          _Imagen(coin: coin),
          SizedBox(
            height: 10,
          ),
          _Symbol(coin: coin),
          _Name(coin: coin),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Text(
      coin.item.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 17,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _Symbol extends StatelessWidget {
  final Coin coin;

  const _Symbol({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      coin.item.symbol,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Imagen extends StatelessWidget {
  final Coin coin;

  const _Imagen({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: FadeInImage(
        height: 65,
        placeholder: AssetImage('assets/loading2.gif'),
        fadeInDuration: Duration(milliseconds: 250),
        fadeInCurve: Curves.fastOutSlowIn,
        image: NetworkImage(coin.item.large),
        fit: BoxFit.cover,
      ),
    );
  }
}
