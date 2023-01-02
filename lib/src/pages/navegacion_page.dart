// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Notifications Page'),
          centerTitle: true,
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            // icon: FaIcon(FontAwesomeIcons.bell),
            icon: Stack(
              children: [
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  right: 0.0,
                  child: BounceInDown(
                    from: 10,
                    animate: (numero > 0) ? true : false,
                    child: Bounce(
                      from: 10,
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = controller,
                      child: Container(
                        width: 12,
                        alignment: Alignment.center,
                        height: 12,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent, shape: BoxShape.circle),
                        child: Text(
                          '$numero',
                          style:
                              const TextStyle(color: Colors.white, fontSize: 9),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notiModel =
            Provider.of<_NotificationModel>(context, listen: false);

        int numero = notiModel.numero;
        numero++;
        notiModel.numero = numero;

        if (numero >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController controller) {
    _bounceController = controller;
    // notifyListeners();
  }
}
