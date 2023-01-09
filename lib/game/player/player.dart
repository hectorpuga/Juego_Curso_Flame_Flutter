import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
// import 'package:flame_audio/flame_audio.dart';
import 'package:juego/game/enemy/enemy.dart';
import 'package:juego/game/my_game.dart';

import '../../common/enums.dart';

class Player extends
// Nos permite agregar un grupo de sprite con animaciones
    SpriteAnimationGroupComponent
    // AnimationStates es una enumracion la cual contiene  contiene 3 enumeraciones las cuales son
    // run, crash, jump, dichas opciones se usan como keys de mapas para seleccionar las animaciones
    <AnimationStates>
    with
        // HasGame<MyGame> Nos ayuda a buscar una instancia especifica de nuestro juego para asi poder acceder a ella
        HasGameRef<MyGame>,
        // Esta clase nos proporciona un metodo el cual se ejecuta al hacer una colision
        CollisionCallbacks {
  // Este constructor Player recibe como parametros imagenes los cuales son los sprite, que son los sprite y un mapa con las animaciones para hacer dicha animacion

  // SpriteAnimationData: Es el tipo de animación que ara nuetro sprite al momento de ser recorrido
  Player(Image image, Map<AnimationStates, SpriteAnimationData> animationMap)
      :
        // Mandamos por parametros el tipo de animación que ara, el sprite que usara para proceder a hacer la animación y las coordenadas a nuestro SpriteAnimationCompoent
        super.fromFrameData(image, animationMap);

  // Variable que se usara para aguardar la posición de X actualmente para no perderla
  double positionX = 0.0;
  // Variable que se usara para aguardar la posición de Y actualmente para no perderla
  double positionY = 0.0;
  // El timer nos sirve para que nuestra animación de colision pueda mostrarse por un periodo de tiempo para asi proceder a mostrar
  // La animación de correr
  Timer hitTimer = Timer(1);
  // Esta variable nos ayuda a controlar la velocidad con la cual saltar nuestro personaje
  double speedY = 0.0;
  // Bandera para verificar si nuestro personaje no ha echo la animación crash
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    // Metodo que ejecutara el timer al momento de aver concluido con el tiepo esperado establecido en su instancia
    hitTimer.onTick = () {
      // la variable current especifica la animación o key del mapa la cual queremos mostrar
      current = AnimationStates.run;
      // Volvemos false el isHit para decir que no ha colisionado nuestro personaje
      isHit = false;
    };
    // la variable current especifica la animación o key del mapa la cual queremos mostrar

    current = AnimationStates.run;
    // Para especificar en que direccion se posicionara nuestro personaje en la coordenada establecida
    anchor = Anchor.bottomLeft;
    // Decimos que PositionX es igual a 32 para que nuestro personaje no este tan pegado al lado izquierdo
    positionX = 32;
    // Declaración donde nuestro personaje estar ubicado en estado vertical
    positionY = (
        // Obtenemos el tamño largo de nuestra pantalla movil
        gameRef.size.y - (gameRef.size.y / 12));
    // Utilizamos position para ya posicionar nuestro personaje con las medidad echas, mediante el metodo vector2 el cual nos ayuda a establecer tamaños o posiciones
    position = Vector2(positionX, positionY);
    // Declaramos el tamño que tendra nuestro personaje de manera global
    size = Vector2.all(100);
    // Añadir RectangleHitbox es necesario para que las colisiones funciones ya qu esta crea un rectangulo al rededor del sprite para que asi pueda detectar la colison el metodo, dicho rectangulo es adaptado automaticamente al tamño del sprite
    add(RectangleHitbox());
    // TODO: implement onMount
  }

  // Metodo el cual nos ayuda a establecer lo que ara nuestro personaje al colisionar
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Enemy && !isHit) {
      hit();
    }
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }

  // Metodo el cual nos dara las instrucciones que ara al momento de colisionar nuestro personaje
  hit() {
    isHit = true;
    // Selecciona la animación que haremos
    current = AnimationStates.crash;
    // Inicia el Timer
    hitTimer.start();
    // Disminuye vidas mediante el provider
    gameRef.gameProvider.life -= 1;
  }

  // Metodo en el cual se establece los calculos o reglas que ara nuestro personaje, ya sea que se mueva o salta, dicho metodo se ejecuta todo el tiempo
  @override
  void update(double dt) {
    // Variable auxiliar que nos ayuda a que no salga de la pantalla nuestro personaje
    double speedAux;

    speedAux = y - speedY;
    // Condicion para que nuestro personaje no salga de la pantalla
    if (speedAux >= 180) {
      y -= speedY;
    }
    speedY -= 0.35;
    if (isOnGround) {
      y = positionY;
      speedY = 0;
      if (current != AnimationStates.run && current != AnimationStates.crash) {
        current = AnimationStates.run;
      }
    }
    // Este metodo nos ayuda a sincronizar nuestro timer con nuestro sprite del juego o en este caso player
    hitTimer.update(dt);

    super.update(dt);
  }

  // Metodo para que nuestro personaje salte

  jump() {
    // FlameAudio.play("jump.mp3");
    if (isOnGround) {
      speedY = 15;
      current = AnimationStates.jump;
    }
  }

  // get el cual nos ayuda a saber si y es mayour que positionY
  bool get isOnGround => (y >= positionY);
}
