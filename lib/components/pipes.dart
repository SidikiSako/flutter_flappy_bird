import 'dart:math';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flappy/flappy_game.dart';

const double PIPE_WIDTH = 70;
const double SPACE_BETWEEN_PIPES = 200;
const double PIPE_MOVEMENT = 130;

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
  //List<int> heights = [25, 50, 75, 100, 150, 200, 250];
  List<double> heights;
  //int space = 200;

  Pipes({this.game}) {
    topPipeHeadSprite = Sprite('pipe_head.png');
    bottomPipeHeadSprite = Sprite('pipe_head.png');
    topPipeBodySprite = Sprite('pipe.png');
    bottomPipeBodySprite = Sprite('pipe.png');

    heights = [
      game.screenSize.height / 6,
      game.screenSize.height / 4,
      game.screenSize.height / 3,
      game.screenSize.height / 2,
    ];

    int index = Random().nextInt(heights.length);
    //double pipeHeight = (game.screenSize.height / 2) - 50;
    double topPipeHeight = heights[index];
    double x = game.screenSize.width + 10;
    //on crée top pipe rect
    topPipeRect = Rect.fromLTWH(x, 0, PIPE_WIDTH, topPipeHeight);

    topPipeHeadRect = Rect.fromLTWH(x, topPipeHeight, PIPE_WIDTH + 2, 24);
    //topPipeHeadRect = Rect.fromCenter(center: center, width: width, height: height)
    bottomPipeRect = Rect.fromLTWH(
        game.screenSize.width + 10,
        topPipeHeight + SPACE_BETWEEN_PIPES,
        PIPE_WIDTH,
        game.screenSize.height - topPipeHeight - SPACE_BETWEEN_PIPES);

    bottomPipeHeadRect = Rect.fromLTWH(
        x, game.screenSize.height - bottomPipeRect.height, PIPE_WIDTH + 2, 24);
  }

  void update(double t) {
    topPipeRect = topPipeRect.translate(-t * PIPE_MOVEMENT, 0);
    bottomPipeRect = bottomPipeRect.translate(-t * PIPE_MOVEMENT, 0);
    topPipeHeadRect = topPipeHeadRect.translate(-t * PIPE_MOVEMENT, 0);
    bottomPipeHeadRect = bottomPipeHeadRect.translate(-t * PIPE_MOVEMENT, 0);
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
