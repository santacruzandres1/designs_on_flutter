import 'package:design_application/config/size/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo, subtitulo;
  final Color color1, color2;

  const IconHeader({
    super.key, 
    required this.icon, 
    required this.titulo, 
    required this.subtitulo, 
    this.color1 = const Color(0xff526BF6),        
    this.color2 = const Color(0xff67ACF2), 
    });

  @override
  Widget build(BuildContext context) {
    final double blockSizeHorizontal = SizeConfig().blockSizeHorizontal;
    final double blockSizeVertical = SizeConfig().blockSizeVertical;
    final Color colorBlanco = Colors.white.withOpacity(0.7);


    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          color1: color1,
          color2: color2,
          blockSizeHorizontal: blockSizeHorizontal,
          blockSizeVertical: blockSizeVertical,
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 230,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
            Column(
              children: [
                const SizedBox(height: 80, width: double.infinity,),
                Text(subtitulo, 
                style: TextStyle(
                  fontSize: 20, 
                  color: colorBlanco,)
                  ),
                const SizedBox(height: 20,),
                Text(titulo, style: TextStyle(fontSize: 25, color:colorBlanco),),
                FaIcon(
                icon, 
                size: 80, 
                color: Colors.white),

              ],
            )
        ]
      );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1, color2;

  const _IconHeaderBackground({
    required this.blockSizeHorizontal,
    required this.blockSizeVertical, 
    required this.color1, 
    required this.color2,
  });

  final double blockSizeHorizontal;
  final double blockSizeVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: blockSizeHorizontal * 100,
      height: blockSizeVertical * 30,
      decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                color1,
                color2,
              ])),
    );
  }
}