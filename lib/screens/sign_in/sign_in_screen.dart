import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/screens/sign_in/components/body.dart';
import 'package:flutter_ecomerce_app/base/base_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecomerce_app/data/remote/auth_service.dart';
import 'package:flutter_ecomerce_app/data/repo/auth_repo.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: Text("Sign In"),
      di: [
        Provider.value(value: AuthService),
        ProxyProvider<AuthService, AuthRepo>(update: (context, authService, previous)=>
            AuthRepo(authService: authService),
        ),
      ],
      bloc: [],
      child: const Body(),
    );
  }
}
