import 'package:flutter/material.dart';

class ImplicitBytweenanimation extends StatefulWidget {
  const ImplicitBytweenanimation({super.key});

  @override
  State<ImplicitBytweenanimation> createState() =>
      _ImplicitBytweenanimationState();
}

class _ImplicitBytweenanimationState extends State<ImplicitBytweenanimation> {
  final tween = ColorTween(begin: Colors.white, end: Colors.red);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Image.asset(
          "assets/images/space.jpeg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        TweenAnimationBuilder<Color?>(
          duration: Duration(seconds: 2),
          curve: Curves.linear,
          tween: tween,
          builder: (_, color, child) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(
                color ?? Colors.transparent,
                BlendMode.modulate,
              ),

              child: Image.asset("assets/images/Sun.png"),
            );
          },
        ),
      ],
    );
  }
}
