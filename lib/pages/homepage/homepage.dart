import 'package:flutter/material.dart';
import 'package:untitled3/pages/homepage/customappbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomePageCustomAppBar(),
        ],
      ),
    );
  }
}
