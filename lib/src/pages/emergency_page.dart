import 'package:design_application/src/widgets/slideshow/button_emergency.dart';
import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right:  16),
          child: Center(
            child: ButtonEmergency(
              title: '',
              onPressed: (){},
            ),
            ),
        ),
      ),
    );
  }
}