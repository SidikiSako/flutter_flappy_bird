import 'dart:math';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flappy/flappy_game.dart';

class Pipes {
  final FlappyGame game;
  Sprite topPipeBodySprite;
  Sprite bottomPipeBodySprite;
  Sprite topPipeHeadSprite;
  Sprite bottomPipeHeadSprite;
  Rect topPipeRect;
  Rect bottomPipeRect;
  Rect topPipeHeadRect;
  Rect bottomPipeHeadRect;
  bool isVisible = true;
  List<int> heights = [25, 50, 75, 100, 150, 200, 250];
  int space = 150;
  double pipeWidth = 70;

  Pipes({this.game}) {
    topPipeHeadSprite = Sprite('pipe_head.png');
    bottomPipeHeadSprite = Sprite('pipe_head.png');
    topPipeBodySprite = Sprite('pipe.png');
    bottomPipeBodySprite = Sprite('pipe.png');
    int index = Random().nextInt(heights.length);
    //double pipeHeight = (game.screenSize.height / 2) - 50;
    double topPipeHeight = (game.screenSize.height / 2) - heights[index];
    double x = game.screenSize.width + 10;
    //on crée top pipe rect
    topPipeRect = Rect.fromLTWH(x, 0, pipeWidth, topPipeHeight);

    topPipeHeadRect = Rect.fromLTWH(x, topPipeHeight, pipeWidth + 2, 24);
    //topPipeHeadRect = Rect.fromCenter(center: center, width: width, height: height)
    bottomPipeRect = Rect.fromLTWH(
        game.screenSize.width + 10,
        topPipeHeight + space,
        pipeWidth,
        game.screenSize.height - topPipeHeight - space);

    bottomPipeHeadRect = Rect.fromLTWH(
        x, game.screenSize.height - bottomPipeRect.height, pipeWidth + 2, 24);
  }

  void update(double t) {
    topPipeRect = topPipeRect.translate(-t * 60, 0);
    bottomPipeRect = bottomPipeRect.translate(-t * 60, 0);
    topPipeHeadRect = topPipeHeadRect.translate(-t * 60, 0);
    bottomPipeHeadRect = bottomPipeHeadRect.translate(-t * 60, 0);
    if (topPipeRect.right < -20) {
      isVisible = false;
    }
  }

  void render(Canvas c) {
    topPipeBodySprite.renderRect(c, topPipeRect);
    topPipeHeadSprite.renderRect(c, topPipeHeadRect);
    bottomPipeBodySprite.renderRect(c, bottomPipeRect);
    bottomPipeHeadSprite.renderRect(c, bottomPipeHeadRect);
  }
}
