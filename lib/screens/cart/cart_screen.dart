import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/models/cart.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'components/body.dart';

class CardScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
          children: [
            Text(
                "Your Cart",
              style: TextStyle(
                color: Colors.black
              ),
            ),
            Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption,
            )
          ],),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30)
      ),
      // we use this height only for demo
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15)
          )
        ]
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SvgPicture.asset("assets/icons/receipt.svg"),
                  ),
                  Spacer(),
                  Text("Add voucher code"),
                  const SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor,)
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total: ",
                      children: [
                        TextSpan(
                          text: "\$337.15",
                          style: TextStyle(fontSize: 16, color: Colors.black)
                        )
                      ]
                    )
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Check Out",
                      press: () {},
                    ),
                  )
                ],
              )
            ],
        ),
      ),
    );
  }
}
