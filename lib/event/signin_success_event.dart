import 'package:flutter/widgets.dart';
import 'package:flutter_ecomerce_app/shared/model/user.dart';

class SignInSuccessEvent extends BaseEvent {
  final User userData;
  SignInSuccessEvent(this.userData);
}
