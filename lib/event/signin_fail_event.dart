import 'package:flutter_ecomerce_app/base/base_event.dart';

class SignInFailEvent extends BaseEvent {
  final String errMessage;
  SignInFailEvent(this.errMessage);
}
