import 'package:design_application/config/size/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonEmergency extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color1, color2;
  final Function onPressed;
  const ButtonEmergency({
    super.key, 
    this.icon = Icons.health_and_safety, 
    required this.title, 
    this.color1 = const Color(0xff526BF6),       
    this.color2 = const Color(0xff67ACF2), 
    required this.onPressed, 
    });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final blockSizeHorizontal = SizeConfig().blockSizeHorizontal;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _EmergencyButtonBackground(
          icon: icon,
          color1: color1,
          color2: color2,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 40),
            FaIcon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: textStyle.titleLarge?.copyWith(color: Colors.white),
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: blockSizeHorizontal / 0.40),
          ],
        ),
      ],
    );
  }
}

class _EmergencyButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1, color2;

  const _EmergencyButtonBackground({required this.icon, required this.color1, required this.color2}); 

  @override
  Widget build(BuildContext context) {
    final widthScreen = SizeConfig().screenWidth;
    final blockSizeVertical = SizeConfig().blockSizeVertical;
    final blockSizeHorizontal = SizeConfig().blockSizeHorizontal;

    double width;
    if (widthScreen > 0 && widthScreen < 601.0) {
      width = blockSizeHorizontal * 100;
    } else if (widthScreen > 600 && widthScreen < 905.0) {
      width = blockSizeHorizontal * 70;
    } else {
      width = 633;
    }

    return Center(
      child: Container(
        width: width,
        height: blockSizeVertical * 10,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(4, 6),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: <Color>[
              color1,
              color2,
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
