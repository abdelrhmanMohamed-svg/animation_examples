import 'dart:math';

import 'package:flutter/material.dart';

Random random = Random();

double randomRaduis() {
  return random.nextDouble() * 64;
}

double randomMargin() {
  return random.nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & random.nextInt(0xFFFFFFFF));
}

class ImplicityBuiltInExample extends StatefulWidget {
  const ImplicityBuiltInExample({super.key});

  @override
  State<ImplicityBuiltInExample> createState() =>
      _ImplicityBuiltInExampleState();
}

class _ImplicityBuiltInExampleState extends State<ImplicityBuiltInExample> {
  late Color color;
  late double padding;
  late double raduis;
  bool isBigger = false;
  double opacity = 0.0;
  @override
  void initState() {
    super.initState();
    color = randomColor();
    raduis = randomRaduis();
    padding = randomMargin();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          curve: Curves.bounceOut,
          height: isBigger ? 250 : 100,
          duration: Duration(seconds: 2),
          child: Image.asset("assets/images/star.png"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isBigger = !isBigger;
            });
          },
          child: Text(
            "to resize the star",
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opacity = 1.0;
            });
          },
          child: Text(
            "Show details",
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),

        AnimatedOpacity(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,

          opacity: opacity,
          child: Column(
            children: [
              Text("name:abdelrhamn"),
              Text("age:23"),
              Text("gender:male"),
            ],
          ),
        ),
        const SizedBox(height: 8),

        AnimatedContainer(
          width: 128,
          height: 128,
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(raduis),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              color = randomColor();
              raduis = randomRaduis();
              padding = randomMargin();
            });
          },
          child: Text(
            "switch",
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
