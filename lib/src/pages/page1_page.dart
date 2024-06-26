import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context),
      body: _bodyBuilder(context),
      floatingActionButton: _floatingActionButtonBuilder(context),
    );
  }

  AppBar appBarBuilder(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text(
        'Animate_do',
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.navigate_next_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => const Page1Page(),));
          },
        ),
      ],
    );
  }
  Widget _bodyBuilder(BuildContext context) {
return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElasticIn(
            delay: const Duration(milliseconds: 1800),
            child: const Icon(Icons.new_releases_sharp, 
                              color: Colors.blue, 
                              size: 40)),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 0), // Sin delay para la primera animación
            child: const Text(
              'Titulo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
            ),
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 800), // Delay para que inicie después de la primera animación
            child: const Text(
              'Soy un texto pequeño',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
          FadeInLeft(
            duration: const Duration(milliseconds: 500),
            delay: const Duration(milliseconds: 1500), // Delay para que inicie después de la segunda animación
            child: Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
  FloatingActionButton _floatingActionButtonBuilder(BuildContext context) {
    return FloatingActionButton(
      child: const FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => const Page1Page(),));
      },
    );
  }
}

// class _BodyBuilder extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
// return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.new_releases_sharp, color: Colors.blue, size: 40),
//           FadeInDown(
//             duration: const Duration(milliseconds: 500),
//             delay: const Duration(milliseconds: 0), // Sin delay para la primera animación
//             child: const Text(
//               'Titulo',
//               style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
//             ),
//           ),
//           FadeInDown(
//             duration: const Duration(milliseconds: 800),
//             delay: const Duration(milliseconds: 800), // Delay para que inicie después de la primera animación
//             child: const Text(
//               'Soy un texto pequeño',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
//             ),
//           ),
//           FadeInLeft(
//             duration: const Duration(milliseconds: 500),
//             delay: const Duration(milliseconds: 1500), // Delay para que inicie después de la segunda animación
//             child: Container(
//               width: 220,
//               height: 2,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
