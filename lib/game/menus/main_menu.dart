import 'package:flutter/material.dart';
import 'package:juego/game/hud/hud.dart';
import 'package:juego/game/my_game.dart';

import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

class MainMenu extends StatelessWidget {
  static const id = "MainMenu";
  final MyGame gameRef;
  const MainMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuBase(buttons: [
      // Menu el cual nos proporciona 2 botones, uno de jugar y otro de opciones
      ButtonMenu(
          onPressed: () {
            // Metodo para remover el overlay del menu actual
            gameRef.overlays.remove(id);
            // Metodo en el cual se añade el Hud donde se muestra la vida
            gameRef.overlays.add(Hud.id);
            // Metodo para que el juego continue ejecutandose
            gameRef.resumeEngine();
            // Funcion la cual agrega los enemigos y al mono del jugador
            gameRef.starGame();
          },
          title: "Jugar",
          icono: Icons.play_arrow_rounded),
      ButtonMenu(onPressed: () {}, title: "Opciones", icono: Icons.settings),
    ]);
  }
}
