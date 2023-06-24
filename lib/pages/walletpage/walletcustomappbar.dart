import 'package:flutter/material.dart';
import 'package:untitled3/utils/const/constcolors.dart';

class WalletCustomAppBar extends StatelessWidget {
  const WalletCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: primarycolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Wallet', style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(width: 30),
          Icon(Icons.search_outlined, color: Colors.white, size: 30)
        ],
      ),
    );
  }
}
