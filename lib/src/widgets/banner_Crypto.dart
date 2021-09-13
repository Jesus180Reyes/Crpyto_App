// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCrypto extends StatelessWidget {
  const BannerCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 220,
        // color: Colors.blue,
        child: CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: (context, index, realIndex) => const PosterImage(),
          options: CarouselOptions(
            // height: 200,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}

class PosterImage extends StatelessWidget {
  const PosterImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700,
      margin: const EdgeInsets.only(top: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: const FadeInImage(
          width: double.infinity,
          // height: 200,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
            'https://img.freepik.com/free-vector/nature-scene-with-river-hills-forest-mountain-landscape-flat-cartoon-style-illustration_1150-37326.jpg?size=626&ext=jpg&ga=GA1.2.2089856124.1629936000',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
