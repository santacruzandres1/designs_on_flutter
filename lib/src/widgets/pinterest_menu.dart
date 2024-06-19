import 'package:design_application/config/size/size_config.dart';
import 'package:flutter/material.dart';

class PinterestButton {
  final IconData icon;
  final Function onPressed;

  PinterestButton({required this.icon, required this.onPressed});
}

class PinterestMenu extends StatelessWidget {
  final heightScreen = SizeConfig().blockSizeVertical;
  final widthScreen = SizeConfig().blockSizeHorizontal;

  final List <PinterestButton>items =  [
    PinterestButton(icon: Icons.price_change, onPressed: (){ print('Icon pie_chart');},),
    PinterestButton(icon: Icons.search, onPressed: (){ print('Icon search');},),
    PinterestButton(icon: Icons.notifications, onPressed: (){ print('Icon notifications');},),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle');},),
  ];
  PinterestMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: menuContainer() ,
    );
  }

  Widget menuContainer() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: widthScreen * 45,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
    );
  }
}
