import 'package:flutter/material.dart';
import 'package:untitled3/utils/const/constcolors.dart';

class WalletCustomAppBar extends StatelessWidget {
  const WalletCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: primarycolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Icon(Icons.account_circle_outlined, size: 30, color: Colors.white,),
            SizedBox(width: 15),
            Text('Wallet', style: TextStyle(color: Colors.white, fontSize: 22)),
            Spacer(flex: 1),
            Icon(Icons.search_outlined, color: Colors.white, size: 30)
          ],
        ),
      ),
    );
  }
}
