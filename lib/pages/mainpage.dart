import 'package:flutter/material.dart';
import 'package:untitled3/pages/tradepage/tradepage.dart';
import 'package:untitled3/pages/walletpage/walletpage.dart';

import '../utils/const/constcolors.dart';
import 'marketspage/marketspage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.isCategory = false}) : super(key: key);
  final bool isCategory;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _bottomnavbarlist = [
    MarketsPage(),
    TradePage(),
    WalletPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[800],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primarycolor,
        onTap: onItemTapped,
        selectedItemColor: navbarcolor,
        unselectedItemColor: Colors.black38,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Markets'),
          BottomNavigationBarItem(icon: Icon(Icons.shop_rounded), label: 'Trade'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded), label: 'Wallet')
        ],
      ),
      body: _bottomnavbarlist[_selectedIndex],
    );
  }
}
