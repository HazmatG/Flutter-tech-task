import 'package:flutter/material.dart';

class HomePageCustomAppBar extends StatelessWidget {
  const HomePageCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Bitcoin', style: TextStyle(fontSize: 20),),
                  Text('-4.3%', style: TextStyle(fontSize: 20, color: Colors.red),),
                ],
              ),
              Column(
                children: [
                  Text('Dogecoin', style: TextStyle(fontSize: 20),),
                  Text('-23.3%', style: TextStyle(fontSize: 20, color: Colors.red),),
                ],
              ),
              Column(
                children: [
                  Text('Ethereum', style: TextStyle(fontSize: 20),),
                  Text('+24.3%', style: TextStyle(fontSize: 20, color: Colors.green),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
