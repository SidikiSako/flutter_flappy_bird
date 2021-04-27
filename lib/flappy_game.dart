import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flappy/components/bg_component.dart';
import 'package:flappy/components/pipes.dart';
import 'package:flame/time.dart';

class FlappyGame extends Game {
  Size screenSize;
  Background background;
  List<Pipes> pipeList = [];
  Timer timer;

  FlappyGame() {
    initialize();
    timer = Timer(4, repeat: true, callback: () {
      var newPipes = Pipes(game: this);
      pipeList.add(newPipes);
    });
    timer.start();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    background = Background(game: this);
    //var pipes = Pipes(game: this);
    //pipeList = [];
    //pipeList.add(pipes);
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    pipeList.forEach((pipes) {
      pipes.render(canvas);
    });
    //pipes.render(canvas);
  }

  @override
  void update(double t) {
    timer.update(t);
    pipeList.forEach((pipes) {
      pipes.update(t);
    });

    // on supprime les pipes qui ne sont plus visible
    pipeList.removeWhere((Pipes pipes) => pipes.isVisible == false);
    //pipes.update(t);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }
}
