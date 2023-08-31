import 'package:flutter_ecomerce_app/base/base_event.dart';

class SignUpFailEvent extends BaseEvent {
  final String message;
  SignUpFailEvent(this.message);

}