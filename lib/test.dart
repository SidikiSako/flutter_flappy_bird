import 'package:flame/components/component.dart';
import 'package:flame/game/base_game.dart';

class TestGame extends BaseGame {
  SpriteComponent flappy;

  TestGame() {
    flappy = SpriteComponent.square(50, 'yellowbird-midflap.png');
    add(flappy);
  }
}

class Flapp extends SpriteComponent {}
