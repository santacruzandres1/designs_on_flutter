import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool _animation = false;

void _toggleSnimation(){
  setState(() {
    _animation = !_animation;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1da1f2),
      body: _bodyBuilder(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _bodyBuilder() {
    return Center(
      child: ZoomOut(
        animate: _animation,
          from: 30,
          duration: const Duration(seconds: 1),
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          )),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
        _toggleSnimation();
        });
      },
      backgroundColor: Colors.blueGrey,
      child: const FaIcon(FontAwesomeIcons.play, color: Colors.white,),
      );
  }
}
