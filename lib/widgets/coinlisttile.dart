import 'package:flutter/material.dart';
import 'package:untitled3/utils/const/constcolors.dart';

class CoinListTileWidget extends StatelessWidget {
  CoinListTileWidget({Key? key,required this.price, required this.bitname,required this.pricechange, required this.upper}) : super(key: key);

  String bitname;
  double price;
  double pricechange;
  double upper;

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
          Text(bitname, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
          // RichText(
          //   text: TextSpan(
          //     style: DefaultTextStyle.of(context).style,
          //     children: const <TextSpan>[
          //       // TextSpan(text: '$bitname', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
          //       // TextSpan(text: '/', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
          //       // TextSpan(text: 'BTC', style: TextStyle(color: Colors.white, fontSize: 14)),
          //     ],
          //   ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(upper.toString(), style: TextStyle(color: coinpriceupcolor, fontSize: 20),),
              Text('\$ ${price.toString()}', style: TextStyle(color: Colors.white, fontSize: 17),),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: pricechange >= 0.00 ? coinpriceupcolor : coinpricedowncolor
              ),
              height: 30,
              width: 100,
              child: Center(child: Text(pricechange.toString(), style: TextStyle(color: Colors.white, fontSize: 18),),
              ))
        ],
      ),
    );
  }
}