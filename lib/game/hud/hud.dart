import 'package:flutter/material.dart';
import 'package:juego/game/hud/components/lives_hud.dart';
import 'package:juego/game/hud/components/pause_button.dart';
import 'package:juego/game/hud/components/score_hud.dart';
import 'package:juego/game/my_game.dart';

class Hud extends StatelessWidget {
  static const id = "Hud";
  final MyGame gameRef;
  const Hud({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [ScoreHud(), PauseButton(gamRef: gameRef), LivesHud()]),
      ),
    );
  }
}
