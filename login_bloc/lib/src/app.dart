import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrap a widget with a Provider, which gives it and its children access to the
    // bloc instance variable in the Provider
    // Note: normally this would be done at a lower level than the MaterialApp
    //       this was done at this level only as an example
    return Provider(
      child: MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
