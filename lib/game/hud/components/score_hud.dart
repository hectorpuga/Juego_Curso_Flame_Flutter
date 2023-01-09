import 'package:flutter/material.dart';
import 'package:juego/provider/game_provider.dart';
import 'package:provider/provider.dart';

class ScoreHud extends StatelessWidget {
  GameProvider? gameProvider;
  ScoreHud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    gameProvider = context.watch<GameProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Score: ${gameProvider!.currentScore}',
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
        Text(
          'High: ${gameProvider!.highScore}',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}
