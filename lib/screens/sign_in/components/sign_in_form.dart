
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/custom_subfix_icon.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecomerce_app/screens/login_success/login_success.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _formKey = GlobalKey<FormState>();
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
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, ForgotPasswordScreen.routeName)
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            DefaultButton(
              text: "Continue",
              press: () => Navigator.pushNamed(context, LoginSuccessScreen.routeName),
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
