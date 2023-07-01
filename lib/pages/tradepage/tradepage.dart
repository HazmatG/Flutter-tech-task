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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    const NumberSettings(),
                    const NumberSettings(),
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      height: 40,
                      width: 180,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.white)),
                      child: const Center(
                        child: Text(
                          '\$ 100.00',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'AVBL:',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          '0',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primarycolor, elevation: 0),
                      child: SizedBox(
                        width: 120,
                        child: Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text('Price',
                        style: TextStyle(color: greycolor, fontSize: 22)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                child: Column(
                  children: [
                    Text('Amount',
                        style: TextStyle(color: greycolor, fontSize: 22)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Obx(()=> controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
              physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index){
                  return CoinListTileWidget(ispurchased: false,price: controller.coinsList[index].currentPrice,
                      bitname: controller.coinsList[index].symbol.toUpperCase(), pricechange: controller.coinsList[index].priceChangePercentage24H, upper: controller.coinsList[index].totalVolume);
                }),
            ),
          )
        ],
    );
  }
}

class NumberSettings extends StatefulWidget {
  const NumberSettings({super.key});

  @override
  State<NumberSettings> createState() => _NumberSettingsState();
}

class _NumberSettingsState extends State<NumberSettings> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      height: 40,
      width: 180,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.minus,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (num > 0) num--;
              });
            },
          ),
          Text(
            '$num',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.plus,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                num++;
              });
            },
          ),
        ],
      ),
    );
  }
}
