import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juego/game/hud/hud.dart';
import 'package:juego/game/my_game.dart';

import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

class PauseMenu extends StatelessWidget {
  static const id = "PauseMenu";
  final MyGame gameRef;
  const PauseMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuBase(buttons: [
      ButtonMenu(
          onPressed: () {
            showHud();
          },
          title: "Reanudar",
          icono: Icons.play_arrow_rounded),
      ButtonMenu(
          onPressed: () {
            showHud();
            gameRef.reset();
            gameRef.starGame();
          },
          title: "Reiniciar",
          icono: Icons.refresh_rounded),
      ButtonMenu(
          onPressed: () {
            SystemNavigator.pop();
          },
          title: "Salir",
          icono: Icons.exit_to_app_rounded),
    ]);
  }

  showHud() {
    gameRef.overlays.remove(id);
    gameRef.overlays.add(Hud.id);
    gameRef.resumeEngine();
  }
}
