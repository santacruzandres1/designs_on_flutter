import 'package:animate_do/animate_do.dart';
import 'package:design_application/src/widgets/glow.dart';
import 'package:flutter/material.dart';

class GlowPage extends StatefulWidget {
  const GlowPage({super.key});

  @override
  State<GlowPage> createState() => _GlowPageState();
}

class _GlowPageState extends State<GlowPage> {
  bool _animate = true;

  void _triggerGlow() {
    setState(() {
      _animate = !_animate;
    });
  }

  void _resetAnimation() {
    setState(() {
      _animate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BodyBuilder(animate: _animate, onEnd: _resetAnimation),
      floatingActionButton:
          _FloatingActionButtonBuilder(triggerGlow: _triggerGlow),
    );
  }
}

class _FloatingActionButtonBuilder extends StatelessWidget {
  final VoidCallback triggerGlow;

  const _FloatingActionButtonBuilder({
    required this.triggerGlow,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: triggerGlow,
      backgroundColor: colors.primary,
      child: Icon(Icons.play_arrow, color: Colors.white),
    );
  }
}

class _BodyBuilder extends StatelessWidget {
  final bool _animate;
  final VoidCallback onEnd;

  const _BodyBuilder({
    required bool animate,
    required this.onEnd,
  }) : _animate = animate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          const SizedBox(height: 32.0),
          FadeIn(
            child: GlowAnimation(
              startDelay: const Duration(milliseconds: 200),
              glowColor: Colors.green,
              glowShape: BoxShape.circle,
              animate: _animate,
              curve: Curves.linear,
              onEnd: onEnd,
              child: const Material(
                elevation: 0,
                shape: CircleBorder(),
                color: Colors.transparent,
                child: Material(
                  elevation: 0,
                  shape: CircleBorder(),
                  color: Colors.transparent,
                  child: ExpandableCircle(radius: 50.0),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
class ExpandableCircle extends StatelessWidget {
  final double radius;

  const ExpandableCircle({
    super.key,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ExpandableCirclePainter(radius: radius),
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
      ),
    );
  }
}

class _ExpandableCirclePainter extends CustomPainter {
  final double radius;

  _ExpandableCirclePainter({
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
