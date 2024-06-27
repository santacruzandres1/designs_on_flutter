import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: _appBarBuilder(),
          body: _bodyBuilder(),
          floatingActionButton: _floatingActionButton(context),
          bottomNavigationBar: _bottomNavigationBarBuilder(context),
        );
      },
    );
  }

  AppBar _appBarBuilder() {
    return AppBar(
      backgroundColor: Colors.pink,
      title: const Center(
        child: Text(
          'Navigation Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _bodyBuilder() {
    return const Center(
      child: Text('Hello World'),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play, color: Colors.white),
      onPressed: () {
        final notificationModel = Provider.of<_NotificationModel>(context, listen: false);
        notificationModel.incrementNotification();
      },
    );
  }

  BottomNavigationBar _bottomNavigationBarBuilder(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                child: BounceAnimation(
                  child: Container(
                    alignment: Alignment.center,
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$numero',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController? _bounceController;

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
    notifyListeners();
  }

  void incrementNotification() {
    numero++;
    if (numero >= 2) {
      _resetBounceController();
      _bounceController?.forward(from: 0.0);
    }
  }

  void _resetBounceController() {
    _bounceController?.reset();
  }

  AnimationController? get bounceController => _bounceController;

  set bounceController(AnimationController? controller) {
    _bounceController = controller;
  }
}


class BounceAnimation extends StatefulWidget {
  final Widget child;

  const BounceAnimation({super.key, required this.child});

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation> with TickerProviderStateMixin {
  _NotificationModel? model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = Provider.of<_NotificationModel>(context);
    model?.bounceController ??= AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void didUpdateWidget(covariant BounceAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    final int numero = Provider.of<_NotificationModel>(context, listen: false).numero;
    if (numero >= 2) {
      model?._resetBounceController();
    }
  }

  @override
  void dispose() {
    model?.bounceController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    if (numero == 0) {
      return Opacity(
        opacity: 0.0,
        child: widget.child,
      );
    } else if (numero >= 2) {
      return Bounce(
        from: 10,
        controller: (controller) => model?.bounceController = controller,
        child: widget.child,
      );
    } else {
      return BounceInDown(
        from: 10,
        animate: true,
        child: widget.child,
      );
    }
  }
}