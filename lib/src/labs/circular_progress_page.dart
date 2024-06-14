import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({
    super.key,
    required double porcentaje,
    });

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      );
      controller.addListener((){
        // print('valor controller: ${controller.value}');
        porcentaje = lerpDouble(
          porcentaje, 
          nuevoPorcentaje, 
          controller.value ) ?? 0.0;

          setState(() {
            
          });
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(),
      floatingActionButton: _floatingActionButtonBuilder(),
    );
  }

  Widget _bodyBuilder() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
          painter: _MyRadialProgress(porcentaje),
        ),
        ),
      ),
    );
  }

  Widget _floatingActionButtonBuilder(){
    return FloatingActionButton(onPressed: _increasePercentage,
    backgroundColor: Colors.pink,
    child: const Icon(Icons.refresh_outlined, color: Colors.white,),
    
    );
  }
  void _increasePercentage() {
    porcentaje = nuevoPorcentaje;
    nuevoPorcentaje += 10;
    if(nuevoPorcentaje > 100){
      nuevoPorcentaje = 0;
      porcentaje = 0;

    }
    _childrenIncreasePercentageUpdateProgress(nuevoPorcentaje);
  }
  
  void _childrenIncreasePercentageUpdateProgress(double newValue) {
    controller.forward(
      from: 0.0
    );
  setState(() {
    nuevoPorcentaje = newValue;
  });
}


}


class _MyRadialProgress extends CustomPainter{
      final double porcentaje;
  _MyRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

  //Círculo completado

    //Lápiz
    final paint = Paint()
          ..strokeWidth = 4
          ..color = Colors.grey 
          ..style = PaintingStyle.stroke;

    //Construccion del Circulo
    Offset center = Offset( (size.width * 0.5), (size.height * 0.5));
    double radio = min(size.width * 0.5, size.height * 0.5 );
    
    canvas.drawCircle(center, radio, paint);

    //Arco

    final paintArco = Paint()
      ..strokeWidth = 20
      ..color = Colors.pink 
      ..style = PaintingStyle.stroke;

      //Parte que se va completando
      double arcAngle = 2 * pi * ( porcentaje/100 );
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio), 
          -pi / 2,
          arcAngle,
          false,
        paintArco,
        );


    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}