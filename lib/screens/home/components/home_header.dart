import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/screens/cart/cart_screen.dart';
import 'package:flutter_ecomerce_app/screens/notification/notification_screen.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfItems: 1,
            press: () {
              Navigator.pushNamed(context, CardScreen.routeName);
            },
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfItems: 3,
            press: () {
              Navigator.pushNamed(context, NotificationScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
