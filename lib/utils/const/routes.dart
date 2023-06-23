import 'package:flutter/material.dart';
import 'package:untitled3/pages/homepage/homepage.dart';
import 'package:untitled3/pages/mainpage.dart';

abstract class TechRoutes {
  static const String homepage = '/';
  static const String marketspage = '/mp';
  static const String tradepage = '/tp';
  static const String fundspage = '/fp';
  static const String profilespage = '/pp';

  static Route<dynamic> GenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (context) => MainPage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}