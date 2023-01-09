import 'package:flutter/material.dart';
import 'package:juego/provider/game_provider.dart';
import 'package:provider/provider.dart';

class LivesHud extends StatelessWidget {
  late GameProvider gameProvider;
  LivesHud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Metodo en el cual con el wath observa cualquier cambio que se haga en dicha clase a un respectivo valor
    gameProvider = context.watch<GameProvider>();
    return Row(
      children: List.generate(
          5,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: (index < gameProvider.life
                    ? Image.asset(
                        "assets/images/brain_full.png",
                        height: 35,
                        width: 35,
                      )
                    : Image.asset(
                        "assets/images/brain_outline.png",
                        height: 35,
                        width: 35,
                        color: Colors.white,
                      )),
              )),
    );
  }
}
