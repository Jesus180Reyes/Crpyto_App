import 'package:cryptocu_app/src/pages/recommended_Crypto_page.dart';
import 'package:flutter/material.dart';

import 'src/pages/tab_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: miTema,
      title: 'Crypto App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const TabsPages(),
        'all': (_) => const RecommendedCryptoPage(),
      },
    );
  }
}
