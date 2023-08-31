import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/event/signin_event.dart';
import 'package:flutter_ecomerce_app/event/signin_fail_event.dart';
import 'package:flutter_ecomerce_app/screens/sign_in/sign_in_bloc.dart';
import 'package:flutter_ecomerce_app/shared/components/custom_subfix_icon.dart';
import 'package:flutter_ecomerce_app/shared/components/default_button.dart';
import 'package:flutter_ecomerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_ecomerce_app/shared/widget/bloc_listener.dart';
import 'package:flutter_ecomerce_app/shared/widget/loading_task.dart';
import 'package:flutter_ecomerce_app/size_config.dart';
import 'package:flutter_ecomerce_app/base/base_event.dart';
import 'package:flutter_ecomerce_app/event/signin_success_event.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final TextEditingController _txtUsernameController = TextEditingController();
  final TextEditingController _txtPasswordController = TextEditingController();

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
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (__) => SignInBloc(authRepo: Provider.of(context)),
      child: Consumer<SignInBloc>(
        builder: (BuildContext context, bloc, Widget? child) {
          return BlocListener<SignInBloc>(
            listener: handleEvent,
            child: LoadingTask(
              bloc: bloc,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildEmailFormField(bloc),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    _buildPassWordField(bloc),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text("Remember me"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, ForgotPasswordScreen.routeName)
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    StreamProvider<bool>.value(
                      initialData: true,
                      value: bloc.btnStream,
                      child: Consumer<bool>(
                        builder: (context, enable, child) => DefaultButton(
                        text: "Continue",
                        press: enable ? () {
                          bloc.event.add(
                              SignInEvent(email: _txtUsernameController.text,
                                  pass: _txtPasswordController.text)
                          );
                        } : () {},
                        ),
                      ),
                    )
                  ],
                )
            ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPassWordField(SignInBloc bloc) {
    return StreamProvider<String?>.value(
      initialData: null,
      value: bloc.passStream,
      child: Consumer<String>(
        builder: (context, msg, child) => TextFormField(
          controller: _txtPasswordController,
          onChanged: (text) => {
            bloc.passSink.add(text)
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: msg,
            suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg",),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailFormField(SignInBloc bloc) {
    return StreamProvider<String?>.value(
      initialData: null,
      value: bloc.emailStream,
      child: Consumer<String>(
        builder: (context, msg, child) => TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _txtUsernameController,
          onChanged: (text) => {
            bloc.emailSink.add(text)
          },
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: msg,
            suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg",),
          ),
        ),
      ),
    );
  }

}