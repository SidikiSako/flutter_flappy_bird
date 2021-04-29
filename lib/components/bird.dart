import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame/time.dart';

import '../flappy_game.dart';

class Bird {
  //Sprite birdSprite;
  Rect birdRect;
  final FlappyGame game;
  double gravity = 0;
  List<Sprite> sprites;
  int spriteIndex = 0;
  Timer timer;
  bool isJumping = false;

  Bird({this.game}) {
    //birdSprite = Sprite('bird_mid.png');
    sprites = [
      Sprite('bird_down.png'),
      Sprite('bird_mid.png'),
      Sprite('bird_up.png'),
    ];
    birdRect = Rect.fromLTWH(100, game.screenSize.height / 2, 50, 35);

    // on change l'image du bird toute les
    timer = Timer(0.08, repeat: true, callback: () {
      spriteIndex += 1;
    });
    timer.start();
  }

  void update(double t) {
    //applique la gravité au bird

    // if (isJumping) {
    //   jump(t);
    //   //isJumping = false;
    // }
    gravity = t * 280;
    //gravity = 4;

    birdRect = birdRect.translate(0, gravity);
    timer.update(t);
  }

  void render(Canvas c) {
    if (spriteIndex == 3) {
      spriteIndex = 0;
    }
    Sprite birdSprite = sprites[spriteIndex];
    birdSprite.renderRect(c, birdRect);
  }

  void jump() {
    //birdRect = birdRect.translate(0, -120);
    birdRect = birdRect.translate(0, -120);
  }
}
