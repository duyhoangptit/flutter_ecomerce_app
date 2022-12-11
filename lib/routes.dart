import 'package:flutter/cupertino.dart';
import 'package:flutter_ecomerce_app/screens/cart/cart_screen.dart';
import 'package:flutter_ecomerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_ecomerce_app/screens/details/detail_screen.dart';
import 'package:flutter_ecomerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecomerce_app/screens/home/home_screen.dart';
import 'package:flutter_ecomerce_app/screens/login_success//login_success.dart';
import 'package:flutter_ecomerce_app/screens/notification/notification_screen.dart';
import 'package:flutter_ecomerce_app/screens/otp/otp_screen.dart';
import 'package:flutter_ecomerce_app/screens/profile/profile_screen.dart';
import 'package:flutter_ecomerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_ecomerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_ecomerce_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CardScreen.routeName: (context) => CardScreen(),
  DetailScreen.routeName: (context) => DetailScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
};