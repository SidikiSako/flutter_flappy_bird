import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flappy/flappy_game.dart';

class Base {
  Sprite baseSprite;
  Rect baseRect;
  final FlappyGame game;
  final double xPos;
  bool isVisible = true;

  Base({this.game, this.xPos}) {
    baseSprite = Sprite('base.png');
    baseRect = Rect.fromLTWH(
        xPos, game.screenSize.height - 150, game.screenSize.width, 150);
  }

  void update(double t) {
    baseRect = baseRect.translate(-t * 100, 0);
    if (baseRect.right <= 0) {
      isVisible = false;
      //game.spawnBase();
    }
  }

  void render(Canvas c) {
    baseSprite.renderRect(c, baseRect);
  }
}
