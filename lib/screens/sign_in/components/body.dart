import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/no_account_text.dart';
import 'package:flutter_ecomerce_app/shared/components/social_card.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/screens/sign_in/components/sign_in_form.dart';
import 'package:flutter_ecomerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_ecomerce_app/size_config.dart';
import 'package:flutter_ecomerce_app/base/base_event.dart';
import 'package:flutter_ecomerce_app/event/signin_success_event.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  handleEvent(BaseEvent event) {
    if (event is SignInSuccessEvent) {
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }

    if (event is SignInFailEvent) {
      final snackBar = SnackBar(
        content: Text(event.errMessage),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Welcome back",
                style: headingStyle,
              ),
              Text(
                "Sign in with your mail and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              SignInForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              NoAccountText(
                press: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
