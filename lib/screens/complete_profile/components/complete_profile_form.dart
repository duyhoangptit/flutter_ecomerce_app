import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/custom_subfix_icon.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/screens/otp/otp_screen.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  final _formKey = GlobalKey<FormState>();

  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            _buildLastNameFormField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            _buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenWidth(40)),
            _buildAddressFormField(),
            SizedBox(height: getProportionateScreenWidth(40)),
            DefaultButton(
              text: "Continue",
              press: () => Navigator.pushNamed(context, OtpScreen.routeName),
            )
          ],
        )
    );
  }

  Widget _buildFirstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg",),
      ),
    );
  }

  Widget _buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg",),
      ),
    );
  }

  Widget _buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg",),
      ),
    );
  }

  Widget _buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg",),
      ),
    );
  }
}
