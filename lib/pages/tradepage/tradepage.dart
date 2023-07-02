import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled3/pages/tradepage/tradecustomappbar.dart';

import '../../models/models.dart';
import '../../utils/const/constcolors.dart';
import '../../widgets/coinlisttile.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            const TradePageCustomAppBar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Wallet:', style: TextStyle(color: Colors.white, fontSize: 25),),
                Obx(()=> controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                  physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return CoinListTileWidget(ispurchased: true,price: controller.coinsList[index].currentPrice,
                          bitname: controller.coinsList[index].symbol.toUpperCase(), pricechange: controller.coinsList[index].priceChangePercentage24H, upper: controller.coinsList[index].totalVolume);
                    }),
                ),
              ],
            )
          ],
    );
  }
}