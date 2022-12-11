import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/custom_subfix_icon.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_ecomerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmPassword = "";

  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildEmailFormField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            _buildPassWordField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            _buildPassWordConfirmField(),
            SizedBox(height: getProportionateScreenWidth(40)),
            DefaultButton(
              text: "Continue",
              press: () => Navigator.pushNamed(context, CompleteProfileScreen.routeName),
            )
          ],
        )
    );
  }

  Widget _buildPassWordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg",),
      ),
    );
  }

  Widget _buildPassWordConfirmField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg",),
      ),
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
