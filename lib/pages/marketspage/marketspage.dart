import 'package:flutter/material.dart';

import '../../widgets/coinlisttile.dart';
import 'marketscustomappbar.dart';

class MarketsPage extends StatelessWidget {
  const MarketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MarketsCustomAppBar(),
        CoinListTileWidget(),
        CoinListTileWidget(),
        CoinListTileWidget(),
      ],
    );
  }
}
