import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/pages/mainpage.dart';
import 'package:untitled3/pages/marketspage/marketspage.dart';
import 'package:untitled3/pages/tradepage/tradepage.dart';
import 'package:untitled3/pages/walletpage/walletpage.dart';
import 'package:untitled3/utils/const/routes.dart';

class TechTask extends StatelessWidget {
  const TechTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

GoRouter router = GoRouter(
  initialLocation: TechRoutes.homepage,
routes: [
  GoRoute(path: TechRoutes.homepage, builder: (context, state) => MainPage()),
  GoRoute(path: TechRoutes.tradepage, builder: (context, state) => TradePage()),
  GoRoute(path: TechRoutes.tradepage, builder: (context, state) => WalletPage()),
]);