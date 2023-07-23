import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_ecomerce_app/base/base_bloc.dart';
import 'package:flutter_ecomerce_app/base/base_event.dart';
import 'package:flutter_ecomerce_app/event/signin_event.dart';
import 'package:flutter_ecomerce_app/event/signin_success_event.dart';
import 'package:flutter_ecomerce_app/event/signin_fail_event.dart';
import 'package:flutter_ecomerce_app/shared/model/user.dart';
import 'package:flutter_ecomerce_app/shared/validator/validation.dart';
import 'package:flutter_ecomerce_app/data/repo/auth_repo.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends BaseBloc with ChangeNotifier {
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  final _userSubject = BehaviorSubject<User>();

  AuthRepo _authRepo;

  SignInBloc({@required AuthRepo authRepo}) {
    _authRepo = authRepo;
    validateForm();
  }

  var emailValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink) {
        if (Validation.isEmailValid(email)) {
          sink.add(null);
          return;
        }
        sink.add("Email invalid");
      });

  var passValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (pass, sink) {
        if (Validation.isPassValid(pass)) {
          sink.add(null);
          return;
        }
        sink.add("Password invalid");
      });

  Stream<String> get emailStream =>
      _emailSubject.stream.transForm(emailValidation);

  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream =>
      _passSubject.stream.transForm(passValidation);

  Sink<String> get passSink => _passSubject.sink;

  Stream<User> get btnStream => _btnSubject.stream;

  Sink<String> get btnSink => _btnSubject.sink;

  Stream<User> get userStream => _userSubject.stream;

  Sink<String> get userSink => _userSubject.sink;

  validateForm() {
    Rx.combineLatest2({
      _emailSubject,
      _passSubject,
          (email, pass) {
        return Validation.isEmailValid(email) && Validation.isPassValid(pass)
      }
    }).listen((enable) {
      btnSink.add(enable);
    });
  }

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case SignInEvent:
        handlerSignIn(event);
        break;
    }
  }

  handlerSignIn(event) {
    btnSink.add(false); //Khi bắt đầu call api thì disable nút sign-in
    loadingSink.add(true); // show loading

    Future.delayed(Duration(seconds: 6), () {
      SignInEvent e = event as SignInEvent;
      _authRepo.signIn(email, pass).then((value) => {
      processEventSink.add(SignInSuccessEvent(value));
      },
          error: (e) {
            btnSink.add(false); // khi co ket qua thi enable btn sign in
            loadingSink.add(false); // hide loading
            processEventSink.add(SignInFailEvent(e.toString()));
          });
    })
  }

  @override
  void dispose() {
    super.dispose();
    print('SignIn close');

    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
    _userSubject.close();
  }
}