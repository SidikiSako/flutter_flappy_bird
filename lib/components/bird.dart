import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flame/time.dart';

import '../flappy_game.dart';

const double GRAVITY = 0.25;

class Bird {
  //Sprite birdSprite;
  Rect birdRect;
  final FlappyGame game;
  //double gravity = 0.25;
  double birdMovement = 0;
  List<Sprite> sprites;
  int spriteIndex = 0;
  Timer timer;
  bool isJumping = false;
  int counter = 0;

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
      birdMovement = -6;
      //birdMovement = -t * 400;
      isJumping = false;
    } else {
      birdMovement = birdMovement + GRAVITY;
    }
    birdRect = birdRect.translate(0, birdMovement);

    // pour la mise à jour des images du bird (battement d'ailes)
    timer.update(t);
  }

  void render(Canvas c) {
    if (spriteIndex == 3) {
      spriteIndex = 0;
    }
    Sprite birdSprite = sprites[spriteIndex];
    c.save();

    // on met l'origine du canva au centre de birdRect
    // c'est cette origine qui sera utilisé comme centre de la rotation
    c.translate(125, birdRect.bottom - (35 / 2));

    // on applique la rotation et on dessine le bird
    c.rotate(birdMovement * 0.06);
    birdSprite.renderRect(c, Rect.fromLTWH(0, 0, 50, 35));

    // on restore le state pour que l'origine du canva redevienne le coin
    // supérieur gauche de l'écran
    c.restore();
  }

  void onTap() {
    isJumping = true;
  }
}
