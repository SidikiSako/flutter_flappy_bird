import 'dart:math';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flappy/flappy_game.dart';

class Pipes {
  final FlappyGame game;
  Rect topPipeRect;
  Rect bottomPipeRect;
  Sprite topPipeSprite;
  Sprite bottomPipeSprite;
  bool isVisible = true;
  List<int> heights = [25, 50, 75, 100, 150, 200, 250];
  int space = 150;

  Pipes({this.game}) {
    topPipeSprite = Sprite('top_pipe.png');
    bottomPipeSprite = Sprite('bottom_pipe.png');
    int index = Random().nextInt(heights.length);
    //double pipeHeight = (game.screenSize.height / 2) - 50;
    double topPipeHeight = (game.screenSize.height / 2) - heights[index];
    double pipeWidth = 70;
    topPipeRect =
        Rect.fromLTWH(game.screenSize.width + 10, 0, pipeWidth, topPipeHeight);

    bottomPipeRect = Rect.fromLTWH(
        game.screenSize.width + 10,
        topPipeHeight + space,
        pipeWidth,
        game.screenSize.height - topPipeHeight - space);
  }

  void update(double t) {
    topPipeRect = topPipeRect.translate(-t * 60, 0);
    bottomPipeRect = bottomPipeRect.translate(-t * 60, 0);
    if (topPipeRect.right < -20) {
      isVisible = false;
    }
  }

  void render(Canvas c) {
    topPipeSprite.renderRect(c, topPipeRect);
    bottomPipeSprite.renderRect(c, bottomPipeRect);
  }
}
