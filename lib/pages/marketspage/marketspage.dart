import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled3/models/bitcoinpost.dart';
import 'package:untitled3/models/models.dart';
import '../../utils/const/constcolors.dart';
import '../../widgets/coinlisttile.dart';
import 'marketscustomappbar.dart';

class MarketsPage extends StatefulWidget {
  const MarketsPage({Key? key}) : super(key: key);

  @override
  State<MarketsPage> createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage> {
  final CoinController controller = Get.put(CoinController());
  @override

  void initState() {
    super.initState();
    getData();
  }

  getData() async {

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MarketsCustomAppBar(),
        Obx(()=> controller.isLoading.value ? Center(child: const CircularProgressIndicator()) : ListView.builder(
            shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
            return CoinListTileWidget(price: controller.coinsList[index].currentPrice,
              bitname: controller.coinsList[index].symbol.toUpperCase(), pricechange: controller.coinsList[index].priceChangePercentage24H, upper: controller.coinsList[index].totalVolume);
          }),
        )
      ],
    );
  }
}

