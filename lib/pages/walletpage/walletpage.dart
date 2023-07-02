import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:untitled3/pages/walletpage/walletcustomappbar.dart';
import '../../models/models.dart';
import '../../utils/const/constcolors.dart';

double balance = 0.0;

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final CoinController _bcontroller = Get.put(CoinController());
  final _balancereplenish = TextEditingController();
  final _balanceBox = Hive.box('CryptoBox');

  void dispose() {
    _balancereplenish.dispose();
  }

  void _addBalanceData() {
    _balanceBox.put(1, double.parse(_balancereplenish.text));
    print(_balanceBox.get(1));
  }

  showBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        color: primarycolor,
        height: 400,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Text('REPLENISH ACCOUNT BALANCE WITH FIAT', style: TextStyle(color: Colors.white, fontSize: 18),),
            ),
            TextField(decoration: InputDecoration(
                suffixIcon: Icon(Icons.attach_money, color: navbarcolor)
            ),
              controller: _balancereplenish,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _addBalanceData();
                  Navigator.pop(context);
                  balance = double.parse(_balancereplenish.text);
                  _balancereplenish.text = '';
                  const snackbar = SnackBar(
                    content: Text('Balance has been successfully replenished'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: greycolor, elevation: 0),
              child: const SizedBox(
                width: 180,
                child: Center(
                  child: Text(
                    'REPLENISH BALANCE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const WalletCustomAppBar(),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Icon(
            Icons.account_circle_outlined,
            size: 120,
            color: Colors.white60,
          ),
        ),
        SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(fontSize: 18, color: Colors.white60),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    '$balance\$',
                    style: const TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greycolor,
                        elevation: 0
                    ),
                    onPressed: () {
                      showBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                        ),
                        Text(
                          'Replenish',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Assets:',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        // ListView.builder(
        //     shrinkWrap: true,
        //     itemCount: 2,
        //     itemBuilder: (context, index) {
        //       return CoinListTileWidget(
        //         ispurchased: true,
        //           price: controller.coinsList[index].currentPrice,
        //           bitname: controller.coinsList[index].symbol.toUpperCase(),
        //           pricechange:
        //               controller.coinsList[index].priceChangePercentage24H,
        //           upper: controller.coinsList[index].totalVolume);
        //     })
      ],
    );
  }
}