import 'package:flutter/widgets.dart';
import 'package:flutter_ecomerce_app/base/base_event.dart';
import 'package:flutter_ecomerce_app/shared/model/user.dart';

class SignUpFailEvent extends BaseEvent {
  final String message;
  SignUpFailEvent(this.message);

}