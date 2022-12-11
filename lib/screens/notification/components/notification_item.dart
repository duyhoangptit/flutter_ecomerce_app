import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key, required this.title, required this.icon, required this.data,
  }) : super(key: key);

  final String title;
  final String icon;
  final Object data;

  // "assets/images/visa.png"
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.contain)),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
            color: Colors.black,
            height: 1.5
        ),
      ),
      subtitle: Text(
        "Thank for watching vidieo.",
        style: TextStyle(color: kTextColor),
      ),
      onTap: () {},
      enabled: true,
    );
  }
}
