import 'package:flutter/material.dart';

import '../labs/ejemplo_linear_progress_indicator.dart';

class WaterLoadingAnimation extends StatefulWidget {
  const WaterLoadingAnimation({super.key});

  @override
  WaterLoadingAnimationState createState() => WaterLoadingAnimationState();
}

class WaterLoadingAnimationState extends State<WaterLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _waveAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _waveAnimation,
        builder: (context, child) {
          return Center(
            child: SizedBox(
              width: 300.0,
              height: 40.0,
              child: LiquidLinearProgressIndicator(
                value: _waveAnimation.value,
                valueColor: const AlwaysStoppedAnimation(
                  Colors.blue,
                ),
                backgroundColor: Colors.grey.shade200,
                borderColor: Colors.blue,
                borderWidth: 5.0,
                borderRadius: 12.0,
                center: Container(), // Inicialmente vacío
              ),
            ),
          );
        },
      ),
    );
  }
}
