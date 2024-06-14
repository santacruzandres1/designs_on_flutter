import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }
}