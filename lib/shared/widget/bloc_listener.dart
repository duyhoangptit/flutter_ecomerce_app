import 'package:flutter/cupertino.dart';
import 'package:flutter_ecomerce_app/base/base_bloc.dart';
import 'package:flutter_ecomerce_app/base/base_event.dart';
import 'package:provider/provider.dart';

class BlocListener<T extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final Function(BaseEvent event) listener;

  BlocListener({
    super.key,
    required this.child,
    required this.listener,
  });

  @override
  State<StatefulWidget> createState() => _BlocListenerState<T>();
}

class _BlocListenerState<T> extends State<BlocListener> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var bloc = Provider.of<T>(context) as BaseBloc;
    bloc.processEventStream.listen(
      (event) {
        widget.listener(event);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<BaseEvent?>.value(
      value: (Provider.of<T>(context) as BaseBloc).processEventStream,
      initialData: null,
      updateShouldNotify: (prev, current) {
        return false;
      },
      child: Consumer<BaseEvent>(
        builder: (context, event, child) {
          return Container(
            child: widget.child,
          );
        },
      ),
    );
  }
}
