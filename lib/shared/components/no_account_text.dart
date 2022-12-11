import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class NoAccountText extends StatelessWidget {

  final VoidCallback press;

  const NoAccountText({
    Key? key, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: getProportionateScreenWidth(16), color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}