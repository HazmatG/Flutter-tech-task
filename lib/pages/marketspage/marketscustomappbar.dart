import 'package:flutter/material.dart';
import 'package:untitled3/utils/const/constcolors.dart';

class MarketsCustomAppBar extends StatelessWidget {
  const MarketsCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: primarycolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Markets', style: TextStyle(color: Colors.white, fontSize: 22)),
            SizedBox(width: 30),
            Icon(Icons.search_outlined, color: Colors.white, size: 30)
          ],
        ),
      ),
    );
  }
}
