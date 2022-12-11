import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: const Body()
    );
  }
}
