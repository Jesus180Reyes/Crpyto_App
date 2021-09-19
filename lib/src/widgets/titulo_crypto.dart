// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TituloCrypto extends StatelessWidget {
  final String titulo;
  final String? seeall;
  final IconData? icon;
  final String tap;
  const TituloCrypto(
      {Key? key,
      required this.titulo,
      this.seeall,
      required this.tap,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Expanded(
            child: Text(
              titulo,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, tap),
            child: Text(
              seeall!,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            icon,
            size: 20,
          ),
        ],
      ),
    );
  }
}
