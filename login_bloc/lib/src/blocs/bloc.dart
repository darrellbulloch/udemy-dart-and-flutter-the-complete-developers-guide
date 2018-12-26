import 'dart:async';
import 'validators.dart'; // A Mixin (like an Interface in Java?)
import 'package:rxdart/rxdart.dart';

// Business Logic Component (BLOC)
// with is like implements in Java?
class Bloc with Validators {
  // final StreamController<String> _emailController =
  //     StreamController<String>.broadcast();
  // final StreamController<String> _passwordController =
  //     StreamController<String>.broadcast();

  // BehaviorSubject in rxdart is a braadcast StreamController that captures the latest item
  // that has been added to the controller, and emits that as the first item to any new
  // listener
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  // Getter - add data to stream
  // Getter returns a function that accepts a string
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Getter - retrieve data from stream
  // Getter returns a stream that accepts a string
  // Whenever someone asks for a stream, transform the data first
  // Give them the stream with the data transformed
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(
      emailStream, passwordStream, (String email, String password) => true);

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Valid Email is $validEmail');
    print('Valid Password is $validPassword');
  }

  // dispose is just a naming convention for a method
  // this is where we do any clean up
  // whenever we are done with this class, we will call this method
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// Global (Singleton) BLOC
//final bloc = Bloc();
