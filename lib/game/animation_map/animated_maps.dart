import 'package:flame/components.dart';
import 'package:juego/common/enums.dart';

double get endXRun => (294 * 10);
double get endXCrash => (endXRun + (294 * 8));
// Getter el cual contendra el mapa con su respectiva llave la cual sera una de los enum las cuales tendra el valor de animaciones
get animationMapPlayer => {
      AnimationStates.run:
          // Animacion de secuencia
          SpriteAnimationData.sequenced(
              // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
              amount: 10,
              // Propiedad en la cual debemos de especificar el tiempo en el cual las imagenes se iran cambiando mediante la animación
              stepTime: 0.1,
              // Pixeles o resolución de cada imagen que recorreremos en el spritesheet
              textureSize: Vector2(294, 409)),
      AnimationStates.crash: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(294, 409),
          texturePosition: Vector2(endXRun, 0)),
      AnimationStates.jump: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(294, 409),
          texturePosition: Vector2(endXCrash, 0)),
    };
double get endXAtackKnighht => (294 * 10);
get animationMapKnight => {
      EnemyStates.attack: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 10,
          stepTime: 0.1,
          textureSize: Vector2(294, 409)),
      EnemyStates.run: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 10,
          stepTime: 0.1,
          textureSize: Vector2(294, 409),
          texturePosition: Vector2(endXAtackKnighht, 0)),
    };
// Para calcular los pixeles donde emepezara la animación de atacar
double get endXAtackNinja => (294 * 9);
get animationMapNinja => {
      EnemyStates.attack: SpriteAnimationData.sequenced(
          // Propiedad en la cual debemos de especificar el numero de frames que recorreremos en nuestro spritesheet
          amount: 9,
          stepTime: 0.1,
          textureSize: Vector2(294, 409)),
      EnemyStates.run: SpriteAnimationData.sequenced(
          amount: 10,
          stepTime: 0.1,
          textureSize: Vector2(294, 409),
          texturePosition: Vector2(endXAtackNinja, 0)),
    };
