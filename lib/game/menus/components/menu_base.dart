import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:juego/game/menus/components/buttom_menu.dart';

class MenuBase extends StatelessWidget {
  final List<ButtonMenu> buttons;
  final Widget? title;
  const MenuBase({Key? key, required this.buttons, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    title ??
        const Text("Zombriella",
            style: TextStyle(fontSize: 40, color: Colors.white));
    return Center(
        // Nos agrega un efecto de defuminado en el fondo
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.black.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(padding: const EdgeInsets.only(bottom: 20), child: title),
            Column(
              children: buttons,
            )
          ]),
        ),
      ),
    ));
  }
}
