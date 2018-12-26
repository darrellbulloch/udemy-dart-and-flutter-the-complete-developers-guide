import 'dart:async';

// A Mixin (like an Interface in Java?)
class Validators {
  // Transformer accepts a String and produces a String
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, EventSink<String> sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email');
      }
    },
  );

  // Transformer accepts a String and produces a String
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, EventSink<String> sink) {
      if (password.length > 3) {
        sink.add(password);
      } else {
        sink.addError('Password must be at least 4 characters');
      }
    },
  );
}
