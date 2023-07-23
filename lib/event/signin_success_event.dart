import 'package:flutter_ecomerce_app/shared/model/user.dart';
import '../base/base_event.dart';

class SignInSuccessEvent extends BaseEvent {
  final User userData;
  SignInSuccessEvent(this.userData);
}
