import 'package:flutter/material.dart';
import 'package:juego/game/hud/hud.dart';
import 'package:juego/game/menus/pause_menu.dart';
import 'package:juego/game/my_game.dart';

class PauseButton extends StatelessWidget {
  final MyGame gamRef;
  const PauseButton({Key? key, required this.gamRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        gamRef.overlays.remove(Hud.id);
        gamRef.overlays.add(PauseMenu.id);
      },
      icon: const Icon(Icons.pause_rounded),
      color: Colors.white,
    );
  }
}
