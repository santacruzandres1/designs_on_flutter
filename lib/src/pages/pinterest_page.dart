import 'package:design_application/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return Stack(
              children: [
                const PinterestGrid(),
                _buildMenuContainer(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuContainer(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context)._mostrar;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(right: 8, left: 8, top: 8),
        child: FloatingMenu(
          mostrar: mostrar,
          // activeColor: Colors.blue,
          // inactiveColor: Colors.grey,
          // backgroundColor: Colors.red,
          items: [
            MenuButton(
                icon: Icons.pie_chart,
                onPressed: () {
                }),
            MenuButton(
                icon: Icons.search,
                onPressed: () {
                }),
            MenuButton(
                icon: Icons.notifications,
                onPressed: () {
                }),
            MenuButton(
                icon: Icons.supervised_user_circle,
                onPressed: () {
                }),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  final ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      crossAxisCount: 2,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          extent: (index % 3 + 3) * 80.0,
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
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors.primaryFixedDim,
        borderRadius: BorderRadius.circular(20),
      ),
      height: extent,
      width: extent,
      child: Center(
        child: Text('Tile ${index + 1}'),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;

  set mostrar(bool value) {
    _mostrar = value;
    notifyListeners();
  }
}
