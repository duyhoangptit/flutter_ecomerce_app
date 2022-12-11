import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_ecomerce_app/screens/splash/components/splash_content.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tiger, Let's Shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Welcome to Tiger, Let's Shop!",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "Welcome to Tiger, Let's Shop!",
      "image": "assets/images/splash_3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity, // center
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (value) => {
                          setState(() {
                            currentPage = value;
                          })
                        },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                          text: splashData[index]["text"].toString(),
                          image: splashData[index]["image"].toString(),
                        ))),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                          text: "Continue",
                          press: () {
                            print("signIn");
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          }
                      ),
                      Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

