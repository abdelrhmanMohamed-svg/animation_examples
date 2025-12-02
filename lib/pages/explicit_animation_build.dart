import 'package:flutter/material.dart';

class ExplicitAnimationBuild extends StatefulWidget {
  const ExplicitAnimationBuild({super.key});

  @override
  State<ExplicitAnimationBuild> createState() => _ExplicitAnimationBuildState();
}

class _ExplicitAnimationBuildState extends State<ExplicitAnimationBuild>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/milky-way.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        Container(decoration: BoxDecoration(color: Colors.black12)),
        Positioned(
          top: 130,
          left: 0,
          right: 0,
          child: Image.asset("assets/images/ufo.png"),
        ),
        AnimatedBuilder(
          animation: _controller,

          builder: (context, child) {
            return ClipPath(
              clipper: BeamClipper(),
              child: Container(
                height: 1000,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    stops: [0, _controller.value],
                    radius: 1.5,
                    colors: const [Colors.yellow, Colors.transparent],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
