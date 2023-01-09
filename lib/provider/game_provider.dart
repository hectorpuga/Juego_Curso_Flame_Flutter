import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  int _life = 5;
  int _currentScore = 0;
  int _highScore = 0;

  int get life => _life;

  set life(int life) {
    if (life <= 5 && life >= 0) {
      _life = life;
    }

    notifyListeners();
  }

  int get currentScore => _currentScore;

  set currentScore(int score) {
    _currentScore = score;
    notifyListeners();
  }

  int get highScore => _highScore;

  saveHighScore() {
    if (_currentScore > _highScore) {
      _highScore = _currentScore;
    }
    notifyListeners();
  }
}
