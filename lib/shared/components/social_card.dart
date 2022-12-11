import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/size_config.dart';
import 'package:flutter_svg/svg.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key, required this.icon, required this.press,
  }) : super(key: key);

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        // ve hinh tron
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
