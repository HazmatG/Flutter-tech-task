import 'package:flutter/material.dart';
import 'package:untitled3/utils/const/constcolors.dart';

class CoinListTileWidget extends StatelessWidget {
  const CoinListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.symmetric(horizontal: 28),
      height: 60,
      color: primarycolor,
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text: 'ZIL', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
                  TextSpan(text: '/', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
                  TextSpan(text: 'BTC', style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('0.00005606', style: TextStyle(color: coinpriceupcolor, fontSize: 20),),
              Text('226.8\$', style: TextStyle(color: Colors.white, fontSize: 14),),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: coinpriceupcolor
            ),
            height: 30,
            width: 50,
            child: Center(child: Text('+5.0', style: TextStyle(color: Colors.white, fontSize: 18),),
          ))
        ],
      ),
    );
  }
}
