import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame/time.dart';

import '../flappy_game.dart';

class Bird {
  //Sprite birdSprite;
  Rect birdRect;
  final FlappyGame game;
  double gravity = 5;
  List<Sprite> sprites;
  int spriteIndex = 0;
  Timer timer;
  bool isJumping = false;
  double maxJumpHeight = 120;

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
    if (isJumping) {
      print("dans update Bird: isJumping == true");
      if (maxJumpHeight == 0) {
        isJumping = false;
        maxJumpHeight = 120;
      } else {
        birdRect = birdRect.translate(0, -12);
        maxJumpHeight = maxJumpHeight - 10;
      }
      //birdRect = birdRect.translate(0, -120);

      //birdRect = birdRect.translate(0, -t * 4000);
      //isJumping = false;
    } else {
      //applique la gravité au bird
      birdRect = birdRect.translate(0, 7);
    }

    timer.update(t);
  }

  void render(Canvas c) {
    if (spriteIndex == 3) {
      spriteIndex = 0;
    }
    Sprite birdSprite = sprites[spriteIndex];
    //birdSprite.renderRect(c, birdRect);
    if (isJumping) {
      print("dans render Bird : isJumping == true");
      //birdSprite.renderRect(c, birdRect);
      c.save();
      c.translate(125, birdRect.bottom - (35 / 2));

      c.rotate(-.3);
      birdSprite.renderRect(c, Rect.fromLTWH(0, 0, 50, 35));

      //isJumping = false;
      c.restore();
    } else {
      //birdSprite.renderRect(c, birdRect);
      c.save();
      c.translate(125, birdRect.bottom - (35 / 2));
      //c.save();
      c.rotate(.3);
      birdSprite.renderRect(c, Rect.fromLTWH(0, 0, 50, 35));
      print("dans render Bird : isJumping == false");
      c.restore();
    }
  }

  void onTap() {
    print("on tap dans Bird.dart");
    isJumping = true;
    //sinon quand on tape plusieurs fois, ça fait un comportement bizarre
    maxJumpHeight = 120;
  }
}
