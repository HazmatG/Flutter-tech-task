import 'package:flutter/material.dart';

import 'homepage/homepage.dart';
import 'marketspage/marketspage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.isCategory = false}) : super(key: key);
  final bool isCategory;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Markets'),
          BottomNavigationBarItem(icon: Icon(Icons.shop_rounded), label: 'Trade'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded), label: 'Wallet')
        ],
      ),
      body: HomePage(),
    );
  }
}
