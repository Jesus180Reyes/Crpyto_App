// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TituloCrypto extends StatelessWidget {
  const TituloCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Expanded(
            child: Text(
              'Top Trending 24Hr',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'all'),
            child: Text(
              'See All',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 20,
          ),
        ],
      ),
    );
  }
}
