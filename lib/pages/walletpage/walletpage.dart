import 'package:flutter/material.dart';
import 'package:untitled3/pages/walletpage/walletcustomappbar.dart';
import 'package:untitled3/widgets/coinlisttile.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const WalletCustomAppBar(),
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Icon(Icons.account_circle_outlined, size: 120, color: Colors.white60,),
        ),
        SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Total Balance', style: TextStyle(fontSize: 18, color: Colors.white60),),
                // Text('6.4520 ETH', style: TextStyle(fontSize: 30, color: Colors.white),),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('\$ 16.0045', style: TextStyle(fontSize: 36, color: Colors.white),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonWidget(title: 'Sent'),
                    ButtonWidget(title: 'Recieve'),
                    ButtonWidget(title: 'Buy'),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        const Text('Assets:', style: TextStyle(fontSize: 22, color: Colors.white,),),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
  required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(30)
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.telegram_rounded, color: Colors.white,),
          Text(title, style: const TextStyle(fontSize: 25, color: Colors.white,),),
        ],
      ),
    );
  }
}
