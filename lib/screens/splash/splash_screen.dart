import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/data/spref/spref.dart';
import 'package:flutter_ecomerce_app/screens/home/home_screen.dart';
import 'package:flutter_ecomerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

import 'components/body.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _startApp();
  }

  _startApp() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        var token = await SPref.instance.get(SPrefCache.ACCESS_TOKEN);
        if (token != null) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          return;
        }
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
        body: Body()
    );
  }
}
