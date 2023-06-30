import 'package:flutter/material.dart';
import 'package:untitled3/pages/mainpage.dart';
import 'package:untitled3/pages/tradepage/tradepage.dart';
import 'package:untitled3/utils/const/constcolors.dart';
import 'package:untitled3/utils/const/routes.dart';

class CoinListTileWidget extends StatelessWidget {
  CoinListTileWidget({Key? key,required this.price, required this.bitname,required this.pricechange, required this.upper}) : super(key: key);

  String bitname;
  double price;
  double pricechange;
  double upper;

  void _buyrequest(BuildContext context) {

    var editControl = TextEditingController();


    showDialog(context: context, builder: (builder) => AlertDialog(
      backgroundColor: primarycolor,
      content: Wrap(
        children: [
          Center(child: Text('Buy $bitname', style: TextStyle(color: navbarcolor, fontWeight: FontWeight.w400, fontSize: 24))),
          TextFormField(decoration: InputDecoration(
            suffixIcon: Icon(Icons.attach_money, color: navbarcolor)
          ),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            controller: editControl,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Current Price:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                    Text('$price', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Available:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                    Text('${price}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                final snackbar = SnackBar(
                  content: Text('Thanks for purchasing'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: coinpriceupcolor, elevation: 0),
              child: SizedBox(
                width: 120,
                height: 60,
                child: Center(
                  child: Text(
                    'BUY $bitname',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: GestureDetector(
        onTap: () {
        },
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bitname, style: TextStyle(fontWeight: FontWeight.bold, color: navbarcolor, fontSize: 20)),
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
                )),
            ElevatedButton(
              onPressed: () {
                _buyrequest(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: coinpriceupcolor, elevation: 0),
              child: const SizedBox(
                width: 60,
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
    );
  }
}