import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/tradepage/tradecustomappbar.dart';

import '../../utils/const/constcolors.dart';

class TradePage extends StatelessWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: ListView(
        children: [
          const TradePageCustomAppBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primarycolor, elevation: 0),
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
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: coinpricedowncolor,
                                elevation: 0),
                            child: const SizedBox(
                              width: 60,
                              child: Center(
                                child: Text(
                                  'Sell',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                    const NumberSettings(),
                    const NumberSettings(),
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      height: 40,
                      width: 180,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.white)),
                      child: const Center(
                        child: Text(
                          '\$ 100.00',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'AVBL:',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          '0',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text('Price',
                        style: TextStyle(color: greycolor, fontSize: 22)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                    const Text('0.000012',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                child: Column(
                  children: [
                    Text('Amount',
                        style: TextStyle(color: greycolor, fontSize: 22)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Text('1453',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NumberSettings extends StatefulWidget {
  const NumberSettings({super.key});

  @override
  State<NumberSettings> createState() => _NumberSettingsState();
}

class _NumberSettingsState extends State<NumberSettings> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      height: 40,
      width: 180,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.minus,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (num > 0) num--;
              });
            },
          ),
          Text(
            '$num',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.plus,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                num++;
              });
            },
          ),
        ],
      ),
    );
  }
}
