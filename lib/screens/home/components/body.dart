import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_products.dart';
import 'spectial_offers.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(30)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(30)),
          DiscountBanner(),
          SizedBox(height: getProportionateScreenWidth(30)),
          Categories(),
          SizedBox(height: getProportionateScreenWidth(30)),
          SpecialOffers(),
          SizedBox(height: getProportionateScreenWidth(30)),
          PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(30)),
        ],
      ),
    ));
  }
}
