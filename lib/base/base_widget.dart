import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PageContainer extends StatelessWidget {
  final String title;
  final Widget child;

  final List<SingleChildWidget> bloc;
  final List<SingleChildWidget> di;
  final List<Widget> actions;

  PageContainer({required this.title, required this.bloc, required this.di, required this.actions, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...di,
        ...bloc,
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: actions,
        ),
        body: child,
      ),
    );
  }
}

class NavigatorProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: <Widget>[],
        ),
      ),
    );
  }
}