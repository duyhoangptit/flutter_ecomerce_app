import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_ecomerce_app/enum.dart';
import 'package:flutter_ecomerce_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
