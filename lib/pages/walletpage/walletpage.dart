import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled3/pages/walletpage/walletcustomappbar.dart';
import 'package:untitled3/widgets/coinlisttile.dart';

import '../../models/models.dart';
import '../../utils/const/constcolors.dart';
import '../../utils/const/routes.dart';
import '../mainpage.dart';

double balance = 0.0;

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final CoinController controller = Get.put(CoinController());

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
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    '$balance\$',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(title: 'Replenish'),
                    ButtonWidget(title: 'Buy Crypto'),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
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

class ButtonWidget extends StatefulWidget {
  ButtonWidget({super.key, required this.title});

  final String title;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  var balancereplenish = TextEditingController();

  showBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return Container(
        color: primarycolor,
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text('REPLENISH ACCOUNT BALANCE WITH FIAT', style: TextStyle(color: Colors.white, fontSize: 18),),
            ),
            TextField(decoration: InputDecoration(
                suffixIcon: Icon(Icons.attach_money, color: navbarcolor)
            ),
              controller: balancereplenish,
              keyboardType: TextInputType.number,
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  Navigator.pop(context);
                  balance = double.parse(balancereplenish.text);
                  balancereplenish.text = '';
                  final snackbar = SnackBar(
                    content: Text('Balance has been succesfully replenished'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: greycolor, elevation: 0),
              child: SizedBox(
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
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: greycolor,
          elevation: 0
        ),
      onPressed: () {
        showBottomSheet(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.monetization_on,
            color: Colors.white,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
