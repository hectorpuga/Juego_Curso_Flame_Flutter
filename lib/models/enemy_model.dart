import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:juego/common/enums.dart';

class EnemyModel {
  Image image;
  Map<EnemyStates, SpriteAnimationData> animationMap;

  EnemyModel(this.image, this.animationMap);
}
