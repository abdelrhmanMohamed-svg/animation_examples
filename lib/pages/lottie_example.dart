import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatelessWidget {
  const LottieExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/business.json", fit: BoxFit.cover),
        ],
      ),
    );
  }
}
