import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
// import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:juego/game/animation_map/animated_maps.dart';
import 'package:juego/game/enemy/enemies.dart';
import 'package:juego/game/enemy/enemy.dart';
import 'package:juego/game/hud/hud.dart';
import 'package:juego/game/lives/lives.dart';
import 'package:juego/game/menus/game_over_menu.dart';
import 'package:juego/game/menus/pause_menu.dart';
import 'package:juego/game/player/player.dart';
import 'package:juego/provider/game_provider.dart';

import 'menus/main_menu.dart';

class MyGame extends FlameGame with TapDetector, HasCollisionDetection {
  // Variable estatica la cual contiene las rutas de las imagenes de los prite a utilizar
  static const imageAssets = [
    "spritesheet.png",
    "enemies/knight.png",
    "enemies/ninja.png",
    "brain.png"
  ];
  // Variables las cuales recibiran una instancia de un play, enemies y lives de forma tardia
  late Player player;
  late Enemies enemies;
  late Lives lives;
  // Utilizacion de nuestro provider
  GameProvider gameProvider;
  // Contructor el cual recibe como parametro la instancia de nuestro provider
  MyGame(this.gameProvider);

  // Metodo el cual se ejecuta al inicio, en donde podemos inicializar o cargar todos los componentes, es como un constructor asincrono
  @override
  Future<void>? onLoad() async {
    // FlameAudio.bgm.initialize();
    // FlameAudio.bgm.play("music.mp3", volume: 30);

    // Metodo el cual nos ayuda a cargar todas las imagenes de un arreglo el cual contiene sus rutas para poder obtenerlas mediante el cache
    await images.loadAll(imageAssets);

    // variable donde cargamos todos nuestro parallaxComponent con el metodo loadParallaxComponent
    final paralaxBackground = await loadParallaxComponent([
      // For para recorrer nuestros parallax del arreglo
      for (int i = 1; i <= 9; i++)
        // Este metodo nos ayuda a llamar nuestros parallax para que puedan ser cargados
        ParallaxImageData("parallax/$i.png")
    ],
        // Velocidad a la cual el parallax se ira recorriendo mediante el juego se ejecuta
        baseVelocity: Vector2(20, 0),
        // Esta propiedad nos ayudara a que nuestros paralax se vayan repitiendo mediante se van recorriendo al ejecutar el juego
        repeat: ImageRepeat.repeatX,
        // Esta propiedad nos ayuda a que cada parallax se mueva a diferente tiempo a una cierta velocidad
        velocityMultiplierDelta: Vector2(1.4, 0));

    // TODO: implement onLoad
    // Añadimos el parallax al juego
    add(paralaxBackground);

    super.onLoad();
  }

  // Metodo el cual nos ayuda a ejecutar el juego al ser llamado
  starGame() {
    // Instanciacion del jugador el cual recibe su respectivo spritesheet cargado al cache con su respectiva animaciónes
    player = Player(images.fromCache("spritesheet.png"), animationMapPlayer);
    // Instanciación de los enemigos la cual reibe las imagenes cargadas al cache
    enemies = Enemies(images);
    // Instanciación de las vidas la cual recibe el sprite de brain.
    lives = Lives(images.fromCache("brain.png"));
    // Añadimos dichas instancias de los componentes
    add(player);
    add(enemies);
    add(lives);
  }

  // Este metodo nos ayuda a remover personaje, enemigos y vidas de nuestro juego
  removeComponents() {
    // Este metodo nos ayuda a remover nuestro player de nuestra pantalla
    player.removeFromParent();
    // Este metodo nos ayuda a remover nuestros enemigos de nuestra pantalla
    enemies.removeAllEnemies();
    // Este metodo nos ayuda a remover nuestros componentes
    enemies.removeFromParent();
    lives.removeAllLives();
    lives.removeFromParent();
  }

  // Este metodo nos ayuda a  reiniciar el juego completo
  reset() {
    removeComponents();
    // Volvemos nuestro current score a 0
    gameProvider.currentScore = 0;
    // Volvemos nuestro life a 5 de nuevo
    gameProvider.life = 5;
  }

  // Metodo que se ejecuta al hacer click a la pantalla del dispositivo movil
  @override
  void onTap() {
    // Llamamos al metodo jump para que nuestro personaje salte
    player.jump();
    super.onTap();
  }

  // Metodo donde se hacen los calculos para que nuestro juego proceda a hacer el renderizado
  @override
  void update(double dt) {
    // Condicional la cual si el menuprincipal o el menu de pausa esta activado, que el juego se detenga o pause
    if (overlays.isActive(MainMenu.id) || overlays.isActive(PauseMenu.id)) {
      //Metodo para pausar nuestro juego
      pauseEngine();
    }
    // Condicional la cual se cumplira si las vidas son menor o igual a cero
    if (gameProvider.life <= 0) {
      // Metodo el cual nos ayuda a remover nuestro Hud
      overlays.remove(Hud.id);
      // Meetodo para añadir el overlay gameovermenu
      overlays.add(GameOverMenu.id);
      // Metodo para aguardar nuestro record mas alto
      gameProvider.saveHighScore();
      //Metodo para pausar nuestro juego
      pauseEngine();
    }
    super.update(dt);
  }

  // Metodo el cual se ejecuta despues del onLoad, cuando se va a mostrar en el widget padre para visualiar el juego
  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
  }

  // Este metodo se llama cuando nuestro juego se aya eliminado de nuestro widget principal
  @override
  void onRemove() {
    // TODO: implement onRemove
    super.onRemove();
  }

  // Metodo para cambiar el color del fondo del juego
  @override
  backgroundColor() => Colors.pink;
}
