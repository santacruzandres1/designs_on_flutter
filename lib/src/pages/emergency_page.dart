import 'package:design_application/config/size/size_config.dart';
import 'package:design_application/src/widgets/custom_header.dart';
import 'package:design_application/src/widgets/slideshow/button_emergency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  _ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    final blockSizeVertical = SizeConfig().blockSizeVertical;
    final items = <_ItemBoton>[
      _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      _ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      _ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      _ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
    ];

      final List<Widget> itemMap = items.map((item) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ButtonEmergency(
          icon: item.icon,
          title: item.texto,
          color1: item.color1,
          color2: item.color2,
          onPressed: () {
            print('${item.texto} button pressed');
          },
        ),
      );
    }).toList();
    
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: blockSizeVertical * 30),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ...itemMap
              ],
            ),
          ),
          _Encabezado()
        ],
      ),
    );
  }

  Widget buttonEmergency(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ButtonEmergency(
        title: 'Title example',
        onPressed: () {
          print('Hiciste click!');
        },
        icon: FontAwesomeIcons.carBurst,
        // color1: Colors.blueAccent,
        // color2: Colors.lightBlue,
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  final blockSizeHorizontal = SizeConfig().blockSizeHorizontal;
  final blockSizeVertical = SizeConfig().blockSizeVertical;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Médica',
          subtitulo: 'Has solicitado',
        ),
        Positioned(
          right: blockSizeHorizontal * 0.5 ,
          top: blockSizeVertical / 0.25,
          child: RawMaterialButton(
            shape: const CircleBorder(),
            onPressed: (){},
            child: FaIcon(
              FontAwesomeIcons.ellipsisVertical, 
              color: Colors.white, size: (blockSizeVertical * 4),)))
      ],
    );
  }
}
