
import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/constant/constants.dart';
import 'package:flutter_ecomerce_app/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  void nextField({required String value, FocusNode? focusNode}) {
    if (value.length == 1) {
      focusNode!.nextFocus();
    }
  }

  @override
  void dispose() {
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) => {
                  nextField(value: value, focusNode: pin2FocusNode)
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin2FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) => {
                  nextField(value: value, focusNode: pin3FocusNode)
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin3FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) => {
                  nextField(value: value, focusNode: pin4FocusNode)
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin4FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) => {
                  pin4FocusNode?.unfocus()
                },
              ),
            )
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.15),
        DefaultButton(text: "Continue", press: () {})
      ],
    );
  }
}
