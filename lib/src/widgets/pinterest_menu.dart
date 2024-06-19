import 'package:design_application/config/size/size_config.dart';
import 'package:flutter/material.dart';

class PinterestButton {
  final IconData icon;
  final Function onPressed;

  PinterestButton({required this.icon, required this.onPressed});
}

class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(
      icon: Icons.price_change,
      onPressed: () {
        print('Icon pie_chart');
      },
    ),
    PinterestButton(
      icon: Icons.search,
      onPressed: () {
        print('Icon search');
      },
    ),
    PinterestButton(
      icon: Icons.notifications,
      onPressed: () {
        print('Icon notifications');
      },
    ),
    PinterestButton(
      icon: Icons.supervised_user_circle,
      onPressed: () {
        print('Icon supervised_user_circle');
      },
    ),
  ];
  PinterestMenu({super.key});
  @override
  Widget build(BuildContext context) {
  final double widthScreen = SizeConfig().blockSizeHorizontal;
    return menuContainer(widthScreen);
  }

  Widget menuContainer(double widthScreen) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: widthScreen * 45,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
      child: _MenuItems(items),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(item.icon),
      onPressed: () => item.onPressed(),

    );
  }
}
