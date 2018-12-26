import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  // forward values to super class
  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  // context is used to locate a widget in the widget hierarchy
  static Bloc of(BuildContext context) {
    // widget will look at its hierarchy contexts and return a widget of type Provider
    // the return of inheritFromWidgetOfExactType() is an InheritedWidget,
    // so downcast it to a Provider in order to access the bloc instance variable
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
