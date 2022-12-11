import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/screens/notification/components/notification_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 30,
        itemBuilder: (context, index) {
          return NotificationItem(
            title: "Thông báo",
            icon: "assets/images/visa.png",
            data: {},
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }
}
