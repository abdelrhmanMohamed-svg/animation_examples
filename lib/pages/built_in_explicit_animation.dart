import 'package:flutter/material.dart';

class BuiltInExplicitAnimation extends StatefulWidget {
  const BuiltInExplicitAnimation({super.key});

  @override
  State<BuiltInExplicitAnimation> createState() =>
      _BuiltInExplicitAnimationState();
}

class _BuiltInExplicitAnimationState extends State<BuiltInExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating) {
          _controller.stop();
        } else {
          _controller.repeat();
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: RotationTransition(
          turns: _controller,
          child: Image.asset("assets/images/hole.png"),
        ),
      ),
    );
  }
}
