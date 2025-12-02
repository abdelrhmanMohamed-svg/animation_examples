import 'package:animation_examples/models/color_model.dart';
import 'package:animation_examples/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class AnthorExampleExplicitAnimtaion extends StatefulWidget {
  const AnthorExampleExplicitAnimtaion({super.key});

  @override
  State<AnthorExampleExplicitAnimtaion> createState() =>
      _AnthorExampleExplicitAnimtaionState();
}

class _AnthorExampleExplicitAnimtaionState
    extends State<AnthorExampleExplicitAnimtaion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Color currnetColor;
  late Color preColor;
  late Alignment alignment;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    currnetColor = colors.last.color;
    preColor = colors.first.color;
    alignment = colors.last.alignment;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: preColor,
              width: double.infinity,
              height: size.height * 0.55,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return ClipPath(
                  clipper: ContainerClipper(
                    value: _controller.value,
                    alignment: alignment,
                  ),
                  child: Container(
                    color: currnetColor,
                    width: double.infinity,
                    height: size.height * 0.55,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: colors.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final color = colors[index];
              return GestureDetector(
                onTap: () {
                  _controller.forward(from: 0).whenComplete(() {
                    preColor = currnetColor;
                    setState(() {});
                  });
                  currnetColor = color.color;
                  alignment = color.alignment;
                },

                child: GridItem(color: color.color),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  final double value;
  final Alignment alignment;
  ContainerClipper({required this.value, required this.alignment});
  @override
  Path getClip(Size size) {
    final path = Path();

    if (alignment == Alignment.topLeft) {
      oval(path, size, Offset(size.width, size.height));
    } else if (alignment == Alignment.topCenter) {
      oval(path, size, Offset(size.width / 2, size.height));
    } else if (alignment == Alignment.topRight) {
      oval(path, size, Offset(0, size.height));
    } else if (alignment == Alignment.centerLeft) {
      oval(path, size, Offset(size.width, size.height / 2));
    } else if (alignment == Alignment.center) {
      oval(path, size, Offset(size.width / 2, size.height / 2));
    } else if (alignment == Alignment.bottomLeft) {
      oval(path, size, Offset(size.width, 0));
    } else if (alignment == Alignment.bottomRight) {
      oval(path, size, Offset(0, 0));
    } else if (alignment == Alignment.bottomCenter) {
      oval(path, size, Offset(size.width / 2, 0));
    }

    return path;
  }

  void oval(Path path, Size size, Offset offset) {
    return path.addOval(
      Rect.fromCenter(
        center: offset,
        width: size.width * value * 2,
        height: size.height * value * 2,
      ),
    );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
