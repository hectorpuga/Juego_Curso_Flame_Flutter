import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:juego/game/my_game.dart';
import 'package:juego/game/player/player.dart';

class Life extends SpriteComponent with HasGameRef<MyGame>, CollisionCallbacks {
  Life(Image image) : super.fromImage(image);

  @override
  Future<void>? onLoad() {
    anchor = Anchor.bottomRight;
    position =
        Vector2(gameRef.size.x - 100, gameRef.size.y - (gameRef.size.y / 12));

    size = Vector2.all(30);
    add(RectangleHitbox());
    // TODO: implement onLoad
    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= 130 * dt;

    // TODO: implement update
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      gameRef.gameProvider.life += 1;
      removeFromParent();
    }
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }
}
