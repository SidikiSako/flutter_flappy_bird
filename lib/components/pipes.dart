import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flappy/flappy_game.dart';

class Pipes {
  final FlappyGame game;
  Rect topPipeRect;
  Rect bottomPipeRect;
  Sprite topPipeSprite;
  Sprite bottomPipeSprite;

  Pipes({this.game}) {
    topPipeSprite = Sprite('pipe-green.png');
    bottomPipeSprite = Sprite('pipe-green.png');
    double pipeHeight = (game.screenSize.height / 2) - 50;
    double pipeWidth = 50;
    topPipeRect =
        Rect.fromLTWH(game.screenSize.width / 2, 0, pipeWidth, pipeHeight);

    bottomPipeRect = Rect.fromLTWH(game.screenSize.width / 2,
        game.screenSize.height - pipeHeight, pipeWidth, pipeHeight);

    topPipeRect.shift(Offset(-2, -2));
  }

  void update(double t) {}

  void render(Canvas c) {
    topPipeSprite.renderRect(c, topPipeRect);
    bottomPipeSprite.renderRect(c, bottomPipeRect);
  }
}
