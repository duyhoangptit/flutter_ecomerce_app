import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/env.dart';
import 'package:flutter_ecomerce_app/routes.dart';
import 'package:flutter_ecomerce_app/theme.dart';

import 'screens/splash/splash_screen.dart';

void main() {
  AppEnvironment.setupEnv(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppEnvironment.title,
      debugShowCheckedModeBanner: AppEnvironment.environment == Environment.dev ? true: false,
      theme: theme(context),
      // home: const SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

}
