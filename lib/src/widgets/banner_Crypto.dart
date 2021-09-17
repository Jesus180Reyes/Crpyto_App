// ignore_for_file: file_names

import 'package:card_swiper/card_swiper.dart';
import 'package:cryptocu_app/src/models/newsCryptoEvent.model.dart';
import 'package:flutter/material.dart';

class BannerCrypto extends StatelessWidget {
  final List<New> news;

  const BannerCrypto({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (news.isEmpty) {
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
    return SafeArea(
      child: SizedBox(
        width: 400,
        height: 220,
        // color: Colors.blue,
        child: Swiper(
          itemCount: news.length,
          autoplay: true,
          autoplayDelay: 10000,
          autoplayDisableOnInteraction: true,
          // viewportFraction: 0.10,
          // scale: 0,
          itemBuilder: (context, int index) {
            return PosterImage(
              news: news[index],
            );
          },
        ),
      ),
    );
  }
}

class PosterImage extends StatelessWidget {
  final New news;

  const PosterImage({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700,
      margin: const EdgeInsets.only(top: 5),
      child: _Imagen(news: news),
    );
  }
}

class _Imagen extends StatelessWidget {
  const _Imagen({
    Key? key,
    required this.news,
  }) : super(key: key);

  final New news;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: (news.screenshot != 'missing_original.png')
          ? FadeInImage(
              // width: double.infinity,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                news.screenshot!,
              ),
              fit: BoxFit.cover,
            )
          : const Image(
              image: NetworkImage('https://i.stack.imgur.com/GNhxO.png'),
            ),
    );
  }
}
