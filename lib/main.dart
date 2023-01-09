import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:juego/game/hud/hud.dart';
import 'package:juego/game/menus/main_menu.dart';
import 'package:juego/game/menus/pause_menu.dart';
import 'package:juego/game/my_game.dart';
import 'package:juego/provider/game_provider.dart';
import 'package:provider/provider.dart';

import 'game/menus/game_over_menu.dart';

void main() {
  // Nos permite hacer funcionar lo que flame nos proporciona
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
    child: const GameZombie(),
  ));
}

class GameZombie extends StatelessWidget {
  const GameZombie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Creacion del provider, el cual usa el read, dicho metodo nos ayuda a ejecutar metodos
    GameProvider gameProvider = context.read<GameProvider>();
    return GameWidget(
      game: MyGame(gameProvider),
      // Nos permite mostrar un widget al inicio de nuestro juego mientras esta cargando
      loadingBuilder: (context) => const Center(
          child: SizedBox(
        width: 200,
        child: LinearProgressIndicator(
          color: Colors.white,
          minHeight: 3,
          backgroundColor: Colors.black,
        ),
      )),
      // Nos permitira agregar diferentes widgets en nuestro juego, ademas de que nuestro podra ser compartido para ser manipulado por componentes
      overlayBuilderMap: {
        MainMenu.id: (_, MyGame gameRef) => MainMenu(
              gameRef: gameRef,
            ),
        PauseMenu.id: (_, MyGame gameRef) => PauseMenu(
              gameRef: gameRef,
            ),
        GameOverMenu.id: (_, MyGame gameRef) => GameOverMenu(gameRef: gameRef),
        Hud.id: (_, MyGame gameRef) => Hud(gameRef: gameRef)
      },

      // Nos permite mostrar alguno de los widgets que creamos en el overlay cuando inicie nuestro juego
      initialActiveOverlays: const [MainMenu.id],
    );
  }
}
