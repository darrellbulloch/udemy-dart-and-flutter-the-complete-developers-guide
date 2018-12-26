import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  @override
  State<Cat> createState() {
    return CatState();
  }
}

class CatState extends State<Cat> {
  // LifeCycle method
  //     - called when a new instance is created
  //     - available only for State classes
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://i.imgur.com/QwhZRyL.png',
    );
  }
}
