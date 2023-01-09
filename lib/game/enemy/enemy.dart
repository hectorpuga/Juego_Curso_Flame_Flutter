import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:juego/game/my_game.dart';
import 'package:juego/game/player/player.dart';

import '../../common/enums.dart';

class Enemy extends SpriteAnimationGroupComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  Enemy(Image image, Map<EnemyStates, SpriteAnimationData> animationMap)
      : super.fromFrameData(image, animationMap);

  bool isHit = false;
  Timer hitTimer = Timer(1);

  @override
  Future<void>? onLoad() {
    // TODO: implement onLoad

    hitTimer.onTick = () {
      current = EnemyStates.run;
      isHit = false;
    };

    current = EnemyStates.run;
    add(RectangleHitbox());

    super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 200 * dt;

    if (x <= 0) {
      gameRef.gameProvider.currentScore += 1;
      removeFromParent();
    }

    hitTimer.update(dt);

    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision

    if (other is Player && !isHit) {
      current = EnemyStates.attack;
      isHit = true;
      hitTimer.start();
    }

    super.onCollision(intersectionPoints, other);
  }
}
