import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBulder(),
      body: _bodyBuilder(),
      floatingActionButton: _floatingActionButton(),
      bottomNavigationBar: _bottomNavigationBarBuilder(),
    );
  }

  AppBar _appBarBulder() {
    return AppBar(
      backgroundColor: Colors.pink,
      title: const Center(
          child: Text(
        'Navigation Page',
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  Widget _bodyBuilder() {
    return const Center(
      child: Text('Hello World'),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const FaIcon(FontAwesomeIcons.play , color: Colors.white,),
        onPressed: () {});
  }

  BottomNavigationBar _bottomNavigationBarBuilder() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items:  [
        const BottomNavigationBarItem(
            label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.pink,)
                child: Container(
                  alignment: Alignment.center,
                  height: 12,
                  width: 12,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      ),),
                
                ),
                ),
              
              ],
          ),
        ),
        const BottomNavigationBarItem(
            label: 'My Dog', icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}
