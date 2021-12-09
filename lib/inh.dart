import 'package:flutter/material.dart';

class Inh extends InheritedWidget {
  const Inh({
    required Key key,
    @required this.object,
    required Widget child,
  }) : super(key: key, child: child);

  final dynamic object;

  static Inh of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Inh>() as Inh;
  }

  @override
  bool updateShouldNotify(Inh old) {
    return object != old.object;
  }
}
