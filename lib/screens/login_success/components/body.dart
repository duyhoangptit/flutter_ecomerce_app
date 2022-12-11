import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/screens/home/home_screen.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04,),
        Image.asset(
            "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
        ),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWith * 0.6,
          child: DefaultButton(text: "Back to home", press: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }),
        ),
        Spacer(),
      ],
    );
  }
}
