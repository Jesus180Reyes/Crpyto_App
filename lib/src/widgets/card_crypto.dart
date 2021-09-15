// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCrpyto extends StatelessWidget {
  const CardCrpyto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 12),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const OperationCard();
        },
      ),
    );
  }
}

class OperationCard extends StatelessWidget {
  const OperationCard({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: FadeInImage(
              height: 75,
              placeholder: AssetImage('assets/loading2.gif'),
              fadeInDuration: Duration(milliseconds: 250),
              fadeInCurve: Curves.fastOutSlowIn,
              image: NetworkImage(
                  'http://1000marcas.net/wp-content/uploads/2020/02/Logo-Ethereum-500x281.png'),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Ethereum',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'USD 3,219.90',
            style: TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
