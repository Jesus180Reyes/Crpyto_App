import 'package:cryptocu_app/src/pages/markets_Cryptos.dart';
import 'package:cryptocu_app/src/services/crypto_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/tab_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CryptoServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: miTema,
        title: 'Crypto App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const TabsPages(),
          'markets': (_) => const MarketsCryptoPage(),
        },
      ),
    );
  }
}
