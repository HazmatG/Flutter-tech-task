import 'package:flutter/material.dart';
import 'package:untitled3/utils/const/routes.dart';

class TechTask extends StatelessWidget {
  const TechTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: TechRoutes.GenerateRoutes,
      initialRoute: TechRoutes.homepage,
    );
  }
}
