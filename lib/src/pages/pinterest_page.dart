import 'package:design_application/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(right: 8, left: 8, top: 8),
          // child: PinterestGrid(),
          child: PinterestMenu(),
          ),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  final List<int> items = List.generate(200, (i) => i);
  PinterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MasonryGridView.count(
      crossAxisCount: 2,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          extent: (index % 3 + 3) * 80,
        );
      },
    );
  }
}
class Tile extends StatelessWidget {
  final int index;
  final double extent;

  const Tile({
    required this.index,
    required this.extent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(76, 175, 80, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      height: extent,
      width: extent,
      child: Center(
        child: Text('Tile ${index+1}'),
      ),
    );
  }
}
