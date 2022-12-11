import 'package:flutter/material.dart';
import 'components/body.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = "/notify";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Notification",
            style: TextStyle(
                color: Colors.black
            ),
          ),
          Text(
            "10 notifications",
            style: Theme.of(context).textTheme.caption,
          )
        ],),
    );
  }
}
