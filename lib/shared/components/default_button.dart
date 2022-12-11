import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text, required this.press})
      : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: buildTextButton(text));
  }

  TextButton buildTextButton(String btnName) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        backgroundColor: kPrimaryColor,
        padding: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
    return TextButton(
      style: flatButtonStyle,
      onPressed: press,
      child: Text(
        btnName,
        style: TextStyle(
          color: Colors.white,
          fontSize: getProportionateScreenWidth(18),
        ),
      ),
    );
  }
}