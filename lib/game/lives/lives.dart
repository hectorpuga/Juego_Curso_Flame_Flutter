import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:juego/game/lives/life.dart';
import 'package:juego/game/my_game.dart';

class Lives extends Component with HasGameRef<MyGame> {
  Image image;
  Timer timer = Timer(5, repeat: true);
  Lives(this.image) {
    timer.onTick = lives;
  }

  @override
  onLoad() {
    timer.start();
    super.onLoad();
    return null;
  }

  @override
  update(double dt) {
    timer.update(dt);
    super.update(dt);
  }

  lives() {
    Life life = Life(image);

    gameRef.add(life);
  }

  removeAllLives() {
    final lives = gameRef.children.whereType<Life>();

    for (var life in lives) {
      life.removeFromParent();
    }
  }
}
