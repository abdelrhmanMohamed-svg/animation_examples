import 'package:flutter/material.dart';

class ColorModel {
  final Color color;
  final Alignment alignment;

  ColorModel({required this.color, required this.alignment});
}

final List<ColorModel> colors = [
  ColorModel(color: Colors.amber, alignment: Alignment.center),
  ColorModel(color: Colors.blue, alignment: Alignment.bottomCenter),
  ColorModel(color: Colors.red, alignment: Alignment.topCenter),
  ColorModel(color: Colors.green, alignment: Alignment.centerLeft),

  ColorModel(color: Colors.pink, alignment: Alignment.bottomLeft),
  ColorModel(color: Colors.purple, alignment: Alignment.bottomRight),
  ColorModel(color: Colors.orange, alignment: Alignment.topLeft),
  ColorModel(color: Colors.brown, alignment: Alignment.topRight),
];
