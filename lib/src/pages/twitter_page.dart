import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1da1f2),
      body: Center(
        child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 40,),
      ),
    );
  }
}