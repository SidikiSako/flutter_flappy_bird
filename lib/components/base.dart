import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flappy/flappy_game.dart';

class Base {
  Sprite baseSprite;
  Rect baseRect;
  final FlappyGame game;
  final double x_pos;
  bool isVisible = true;

  Base({this.game, this.x_pos}) {
    baseSprite = Sprite('base.png');
    baseRect = Rect.fromLTWH(
        x_pos, game.screenSize.height - 150, game.screenSize.width, 150);
  }

  void update(double t) {
    baseRect = baseRect.translate(-t * 60, 0);
    if (baseRect.right <= 0) {
      isVisible = false;
      //game.spawnBase();
    }
  }

  void render(Canvas c) {
    baseSprite.renderRect(c, baseRect);
  }
}
