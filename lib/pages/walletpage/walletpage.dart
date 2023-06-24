import 'package:flutter/material.dart';
import 'package:untitled3/pages/walletpage/walletcustomappbar.dart';
import 'package:untitled3/widgets/coinlisttile.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        WalletCustomAppBar(),
        CoinListTileWidget(),
        CoinListTileWidget(),
      ],
    );
  }
}
