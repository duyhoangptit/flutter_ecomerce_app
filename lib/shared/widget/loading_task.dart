import 'package:flutter/material.dart';
import 'package:flutter_ecomerce_app/base/base_bloc.dart';
import 'package:flutter_ecomerce_app/shared/widget/scale_animation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingTask extends StatelessWidget {
  final BaseBloc bloc;
  final Widget child;

  LoadingTask({
    required this.bloc,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamProvider<bool>.value(
      value: bloc.loadingStream,
      initialData: false,
      child: Stack(
        children: <Widget>[
          child,
          Consumer<bool>(
            builder: (context, isLoading, child) => Center(
              child: isLoading
                  ? ScaleAnimation(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: const SpinKitRotatingCircle(
                    color: Colors.white,
                  ),
                ),
              )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}