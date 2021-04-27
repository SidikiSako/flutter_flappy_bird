import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flappy/components/bg_component.dart';
import 'package:flappy/components/pipes.dart';

class FlappyGame extends Game {
  Size screenSize;
  Background background;
  Pipes pipes;

  FlappyGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    background = Background(game: this);
    pipes = Pipes(game: this);
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    pipes.render(canvas);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  @override
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }
}
