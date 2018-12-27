import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'src/app.dart';

void main() {
  // Root widget of the application
  Widget app = App();

  // Causes each RenderBox to paint a box around its bounds,
  // and some extra boxes, such as RenderPadding, to draw construction lines.
  debugPaintSizeEnabled = true;

  // To see how large the hit test box of a GestureDetector
  // is for debugging purposes, set debugPaintPointersEnabled to true.
  debugPaintPointersEnabled = true;

  // Inflate the root widget and attach
  // it to the screen.
  runApp(app);
}
