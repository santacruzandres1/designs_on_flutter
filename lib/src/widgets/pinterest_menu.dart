import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:design_application/config/size/size_config.dart';

class MenuButton {
  final IconData icon;
  final Function onPressed;
  MenuButton({required this.icon, required this.onPressed});
}

class FloatingMenu extends StatefulWidget {
  final bool mostrar;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final List<MenuButton> items;


  const FloatingMenu({
    super.key,
    this.mostrar = true,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    required this.items,
  });

  @override
  FloatingMenuState createState() => FloatingMenuState();
}

class FloatingMenuState extends State<FloatingMenu> {
  // ignore: library_private_types_in_public_api
  late _MenuModel menuModel;

  @override
  void initState() {
    super.initState();
    menuModel = _MenuModel(
      activeColor: widget.activeColor ?? Colors.transparent,
      inactiveColor: widget.inactiveColor ?? Colors.transparent,
      backgroundColor: widget.backgroundColor ?? Colors.transparent,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final colors = Theme.of(context).colorScheme;
    menuModel.updateColors(
      widget.activeColor ?? colors.primary,
      widget.inactiveColor ?? colors.onSecondaryFixedVariant,
      widget.backgroundColor ?? Colors.white,
    );
  }

  @override
  void didUpdateWidget(covariant FloatingMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (
          widget.activeColor != oldWidget.activeColor || 
          widget.inactiveColor != oldWidget.inactiveColor ||
          widget.backgroundColor != oldWidget.backgroundColor
      ) {
      final colors = Theme.of(context).colorScheme;
      menuModel.updateColors(
        widget.activeColor ?? colors.primary,
        widget.inactiveColor ?? colors.onSecondaryFixedVariant,
        widget.backgroundColor ?? Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isVisible = widget.mostrar;
    final double widthScreen = SizeConfig().blockSizeHorizontal;

    return ChangeNotifierProvider.value(
      value: menuModel,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (isVisible) ? 1 : 0,
        child: floatingMenuBackground(widthScreen),
      ),
    );
  }

  Widget floatingMenuBackground(double widthScreen) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: widthScreen * 50,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: menuModel.backgroundColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: _MenuItems(widget.items),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<MenuButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          menuItems.length,
          (i) => _FloatingMenuButton(i, menuItems[i]),
        ),
      ),
    );
  }
}

class _FloatingMenuButton extends StatelessWidget {
  final int index;
  final MenuButton item;

  const _FloatingMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return Consumer<_MenuModel>(
      builder: (context, menuModel, _) => IconButton(
        icon: Icon(item.icon),
        onPressed: () {
          menuModel.itemSeleccionado = index; // Actualiza el ítem seleccionado
          item.onPressed(); // Llama a la función onPressed del ítem
        },
        color: (menuModel.itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
        iconSize: (menuModel.itemSeleccionado == index) ? 35 : 25,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor;
  Color _activeColor;
  Color _inactiveColor;

  _MenuModel({
    required Color activeColor,
    required Color inactiveColor,
    required Color backgroundColor,
  })  : _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _backgroundColor = backgroundColor;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;

  Color get activeColor => _activeColor;

  Color get inactiveColor => _inactiveColor;


  void updateColors(Color newActiveColor, Color newInactiveColor, Color newBackgroundColor) {
    _backgroundColor = newBackgroundColor;
      _activeColor = newActiveColor;
    _inactiveColor = newInactiveColor;
    notifyListeners();
  }
}
