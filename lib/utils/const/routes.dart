import 'package:flutter/material.dart';
import 'package:untitled3/pages/mainpage.dart';
import 'package:untitled3/pages/walletpage/walletpage.dart';

import '../../pages/tradepage/tradepage.dart';

abstract class TechRoutes {
  static const String homepage = '/';
  static const String marketspage = '/mp';
  static const String tradepage = '/tp';
  static const String walletpage = '/wp';

  static Route<dynamic> GenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (context) => MainPage());
      case tradepage:
        return MaterialPageRoute(builder: (context) => TradePage());
      case walletpage:
        return MaterialPageRoute(builder: (context) => WalletPage());
      default:
        return MaterialPageRoute(builder: (context) => MainPage());
    }
  }
}