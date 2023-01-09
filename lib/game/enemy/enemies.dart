import 'dart:math';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:juego/game/animation_map/animated_maps.dart';
import 'package:juego/game/enemy/enemy.dart';
import 'package:juego/game/my_game.dart';
import 'package:juego/models/enemy_model.dart';

class Enemies extends Component with HasGameRef<MyGame> {
  Images images;
  Enemies(this.images) {
    timer.onTick = randomEnemy;
  }
  List<EnemyModel> enemies = [];
  final Timer timer = Timer(3, repeat: true);
  @override
  Future<void>? onLoad() {
    if (enemies.isEmpty) {
      enemies = [
        EnemyModel(images.fromCache("enemies/knight.png"), animationMapKnight),
        EnemyModel(images.fromCache("enemies/ninja.png"), animationMapNinja)
      ];
    }
    timer.start();

    // TODO: implement onLoad
    return super.onLoad();
  }

  @override
  void update(double dt) {
    timer.update(dt);
    super.update(dt);
    ;
  }

  randomEnemy() {
    final randomIndex = Random().nextInt(enemies.length);
    EnemyModel enemyModel = enemies.elementAt(randomIndex);
    Enemy enemy = Enemy(enemyModel.image, enemyModel.animationMap);

    enemy.anchor = Anchor.bottomRight;
    enemy.position =
        Vector2(gameRef.size.x + 50, (gameRef.size.y - (gameRef.size.y / 12)));
    enemy.size = Vector2.all(60);

    gameRef.add(enemy);
  }

  removeAllEnemies() {
    timer.reset();
    final enemies = gameRef.children.whereType<Enemy>();
    for (var enemy in enemies) {
      enemy.removeFromParent();
    }
  }
}
