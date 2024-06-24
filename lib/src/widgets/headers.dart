import 'package:design_application/config/size/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      //Properties
      ..color = const Color(0xff615AAB)
      // ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill
      ..strokeWidth = 29;

    // Draw with path and pencil
    final path = Path()
      ..moveTo(0, size.height * 0.30)
      ..lineTo(size.width, size.height * 0.20)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      //Properties
      ..color = const Color.fromARGB(255, 90, 120, 171)
      // ..style = PaintingStyle.stroke
      ..style = PaintingStyle.fill
      ..strokeWidth = 29;

    // Draw with path and pencil
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPinter(),
      ),
    );
  }
}

class _HeaderPicoPinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 90, 129, 171)
      ..style = PaintingStyle.fill
      ..strokeWidth = 40;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.2)
      ..lineTo(size.width / 2, size.height * 0.3)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
//Paint
    final paint = Paint()
      ..color = const Color(0xFF5A6EAB)
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

//Path
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((size.width * 0), (size.height * 0.2))
      ..quadraticBezierTo((size.width * 0.5), (size.height * 0.4), (size.width),
          (size.height * 0.2))
      ..lineTo((size.width), (size.height * 0));

//Canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
//Paint
    final paint = Paint()
      ..color = const Color.fromARGB(255, 90, 110, 171)
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

//Path
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((size.width * 0), (size.height * 0.3))
      ..quadraticBezierTo((size.width * 0.25), (size.height * 0.4),
          (size.width * 0.5), (size.height * 0.3))
      ..quadraticBezierTo((size.width * 0.75), (size.height * 0.2),
          (size.width), (size.height * 0.3))
      ..lineTo((size.width), (size.height * 0));

//Canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveBottom extends StatelessWidget {
  const HeaderWaveBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveBottomPainter(),
      ),
    );
  }
}

class _HeaderWaveBottomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
//Paint
    final paint = Paint()
      ..color = const Color(0xFF5A6EAB)
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

//Path
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo((size.width * 0.25), (size.height * 0.7),
          (size.width * 0.5), (size.height * 0.8))
      ..quadraticBezierTo((size.width * 0.75), (size.height * 0.9), size.width,
          (size.height * 0.8))
      ..lineTo(size.width, size.height);

//Canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Rect Shader
    final Rect rect = Rect.fromCircle(
      center: const Offset(165, 320),
      radius: 180,
    );

    //Gradient
    const Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color.fromARGB(255, 110, 13, 229),
          Color.fromRGBO(180, 12, 241, 1),
          Color.fromARGB(255, 113, 16, 248)
        ]);

    //Paint
    final paint = Paint()
      ..color = const Color(0xff615AAB)
      // ..color =  Color(0xFF5AAB75)
      ..style = PaintingStyle.fill
      ..strokeWidth = 20
      ..shader = gradient.createShader(rect);

//Path
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((size.width * 0), (size.height * 0.3))
      ..quadraticBezierTo((size.width * 0.25), (size.height * 0.4),
          (size.width * 0.5), (size.height * 0.3))
      ..quadraticBezierTo((size.width * 0.75), (size.height * 0.2),
          (size.width), (size.height * 0.3))
      ..lineTo((size.width), (size.height * 0));

//Canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
