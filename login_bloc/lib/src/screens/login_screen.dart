import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bloc bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  // Use stateless field (TextField) with Business Logic Component (BLOC)
  // Note: TextFormField is a stateful widget used with Forms
  Widget emailField(Bloc bloc) {
    // StreamBuilder returns a new Widget everytime via the builder method
    return StreamBuilder(
      stream: bloc.emailStream,
      // Every time an event is emitter on the stream, this builder function runs
      // to rerender the widget on the stream
      // snapshot will contain the data on the stream
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          // Emit an event on the stream when data is changed
          onChanged: (String newValue) {
            print('email value is $newValue');
            bloc.changeEmail(newValue);
          },
          // Shorthand
          //onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  // Use stateless field (TextField) with Business Logic Component (BLOC)
  // Note: TextFormField is a stateful widget used with Forms
  Widget passwordField(Bloc bloc) {
    // StreamBuilder returns a new Widget everytime via the builder method
    return StreamBuilder(
      stream: bloc.passwordStream,
      // Every time an event is emitter on the stream, this builder function runs
      // to rerender the widget on the stream
      // snapshot will contain the data on the stream
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          // Emit an event on the stream when data is changed
          onChanged: (String newValue) {
            bloc.changePassword(newValue);
          },
          // Shorthand
          //onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    // StreamBuilder returns a new Widget everytime via the builder method
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot
                  .hasData // could not use hasError because it is null by default which falsely indicates no error
              ? bloc.submit
              : null,
        );
      },
    );
  }
}
