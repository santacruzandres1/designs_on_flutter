import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class GraficasCircularesPage extends StatefulWidget {
  final double? size;
  final double? sistrokeWidth;
  final Color? color;
  final Color? backgroundColor;

  const GraficasCircularesPage({
    super.key,
    this.size = 200,
    this.sistrokeWidth,
    this.color,
    this.backgroundColor,
  });

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  late Timer timer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _startLoading() {
    double baseIncrement = 1;
    double time = 0;
    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      setState(() {
        // Incrementa el tiempo y calcula un nuevo incremento basado en la función seno
        time += 0.1;
        double increment = baseIncrement + sin(time) * baseIncrement;

        porcentaje += increment;
        if (porcentaje > 100) {
          porcentaje = 100;
          timer.cancel();
          isLoading = false;
        }
      });
    });
  }

  void _toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });

    if (isLoading) {
      // Si estaba cargando, cancela el temporizador actual
      porcentaje = 0;
      _startLoading();
    } else {
      // Si no estaba cargando, pausa el temporizador
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(context),
      floatingActionButton: _floatingActionButtonBuilder(),
    );  
  }

  Widget _bodyBuilder(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: _childrenInBodyBuilderCustomRadial(colors),
    );
  }

  Widget _childrenInBodyBuilderCustomRadial(ColorScheme colors) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: RadialProgress(
        porcentaje: porcentaje,
        size: widget.size!,
        strokeWidth: widget.sistrokeWidth ?? widget.size! / 15,
        colorPrimario: widget.color ?? colors.primary,
        colorSecundario: widget.backgroundColor ?? colors.surfaceDim,
      ),
    );
  }

  Widget _floatingActionButtonBuilder() {
    return FloatingActionButton(
      onPressed: _toggleLoading,
      child: Icon(isLoading ? Icons.stop : Icons.play_arrow),
    );
  }
}
