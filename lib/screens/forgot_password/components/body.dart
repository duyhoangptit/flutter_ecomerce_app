import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/custom_subfix_icon.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/shared/components/no_account_text.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/screens/login_success/login_success.dart';
import 'package:flutter_ecomerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04,),
              Text(
                "Forgot Password",
                style: headingStyle,
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1,),
              ForgotPassForm()
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {

  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  List<String> errors = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildEmailFormField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            SizedBox(height: SizeConfig.screenHeight * 0.1,),
            DefaultButton(
              text: "Continue",
              press: () => {
                // if (this._formKey.currentState.validate()) {
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName)
                // }
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.1,),
            NoAccountText(press: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },)
          ],
        )
    );
  }

  Widget _buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg",),
      ),
    );
  }
}
