import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'tab1_Page.dart';
import 'tab2_Page.dart';
import 'tab3_page.dart';

class TabsPages extends StatelessWidget {
  const TabsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegationModel(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: _Paginas(),
        bottomNavigationBar: _Navegation(),
        // floatingActionButton: _FloatingButton(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);

    return PageView(
      controller: navegationModel._pageController,
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Page(),
        Tab2Page(),
        Tab3Page(),
      ],
    );
  }
}

class _Navegation extends StatelessWidget {
  const _Navegation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_NavegationModel>(context);

    return BottomNavigationBar(
      onTap: (i) => navegationModel.paginaActual = i,
      // backgroundColor: Colors.white,
      currentIndex: navegationModel._paginaActual,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 27,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          // activeIcon: Icon(Icons.favorite),
          icon: Icon(
            Icons.search_outlined,
            size: 27,
          ),

          label: 'Search',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.favorite,
            // size: 27,
          ),
          icon: Icon(
            Icons.favorite_border_outlined,
            size: 27,
          ),
          label: 'Watchlist',
        ),
      ],
    );
  }
}

//modulo para usar el provider y pasar de un tab a otro
class _NavegationModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
