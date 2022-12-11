import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/models/product.dart';
import 'package:flutter_ecomerce_app/screens/home/components/section_title.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

import 'product_card.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length, (index) {
                if (demoProducts[index].isPopular)
                  return ProductCard(product: demoProducts[index]);

                return SizedBox
                    .shrink(); // here by default width and height is 0
              }),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
