import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juego/game/my_game.dart';
import 'package:juego/provider/game_provider.dart';
import 'package:provider/provider.dart';

import '../hud/hud.dart';
import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

class GameOverMenu extends StatelessWidget {
  static const id = "GameOverMenu";
  final MyGame gameRef;
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider = context.watch<GameProvider>();

    return MenuBase(
        title: Column(children: [
          const Text(
            "Game Over",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Text(
            "Score: ${gameProvider.highScore}",
            style: const TextStyle(fontSize: 30, color: Colors.white),
          )
        ]),
        buttons: [
          ButtonMenu(
              onPressed: () {
                gameRef.overlays.remove(id);
                gameRef.overlays.add(Hud.id);
                gameRef.resumeEngine();
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
}
