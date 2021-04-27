import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flappy/flappy_game.dart';

class Background {
  final FlappyGame game;
  Rect bgRect;
  Sprite bgSprite;

  Background({this.game}) {
    bgSprite = Sprite('background-day.png');
    bgRect = Rect.fromLTWH(0, 0, game.screenSize.width, game.screenSize.height);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
