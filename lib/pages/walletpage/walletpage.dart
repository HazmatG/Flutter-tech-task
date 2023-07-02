import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:untitled3/pages/walletpage/walletcustomappbar.dart';
import '../../models/models.dart';
import '../../utils/const/constcolors.dart';
import '../../widgets/coinlisttile.dart';


class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final CoinController _bcontroller = Get.put(CoinController());
  final _balancereplenish = TextEditingController();
  final _moneywithdraw = TextEditingController();
  final _balanceBox = Hive.box('CryptoBox');

  void dispose() {
    super.dispose();
    _balancereplenish.dispose();
  }

  repBalBottomSheet(BuildContext context) {
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
                  _balanceBox.put(1, _balanceBox.get(1) + double.parse(_balancereplenish.text));
                  Navigator.pop(context);
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
  withMonBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        color: primarycolor,
        height: 400,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Text('Withdraw money to Visa', style: TextStyle(color: Colors.white, fontSize: 18),),
            ),
            TextField(decoration: InputDecoration(
                suffixIcon: Icon(Icons.attach_money, color: navbarcolor)
            ),
              controller: _moneywithdraw,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _balanceBox.put(1, _balanceBox.get(1) - double.parse(_moneywithdraw.text));
                  Navigator.pop(context);
                  _moneywithdraw.text = '';
                  const snackbar = SnackBar(
                    content: Text('Money has been sent to your Visa Card'),
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
                    '${_balanceBox.get(1)}\$',
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
                      repBalBottomSheet(context);
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
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greycolor,
                        elevation: 0
                    ),
                    onPressed: () {
                      withMonBottomSheet(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                        ),
                        Text(
                          'Withdraw',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
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
        ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return CoinListTileWidget(
                ispurchased: true,
                  price: _bcontroller.coinsList[index].currentPrice,
                  bitname: _bcontroller.coinsList[index].symbol.toUpperCase(),
                  pricechange:
                  _bcontroller.coinsList[index].priceChangePercentage24H,
                  upper: _bcontroller.coinsList[index].totalVolume);
            })
      ],
    );
  }
}