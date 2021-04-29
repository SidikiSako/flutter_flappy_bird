import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flappy/components/base.dart';
import 'package:flappy/components/bg_component.dart';
import 'package:flappy/components/pipes.dart';
import 'package:flame/time.dart';

class FlappyGame extends Game {
  Size screenSize;
  Background background;
  List<Pipes> pipeList = [];
  Timer timer;
  List<Base> baseList;

  FlappyGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    background = Background(game: this);

// affichage des pipe à l'aide du timer
    timer = Timer(4, repeat: true, callback: () {
      print("pipeList.length = ${pipeList.length}");
      var newPipes = Pipes(game: this);
      print(
          'new top pipe : top = ${newPipes.topPipeRect.top} and height = ${newPipes.topPipeRect.height}');
      print(
          'new bottom pipe : top = ${newPipes.bottomPipeRect.top} and height = ${newPipes.bottomPipeRect.height}');

      pipeList.add(newPipes);
      print("pipeList.length = ${pipeList.length}");
    });
    timer.start();
    //on affiche les sols
    spawnBase();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    pipeList.forEach((pipes) {
      pipes.render(canvas);
    });

    baseList.forEach((Base base) {
      base.render(canvas);
    });
  }

  @override
  void update(double t) {
    timer.update(t);
    pipeList.forEach((pipes) {
      pipes.update(t);
    });

    // on supprime les pipes qui ne sont plus visible
    pipeList.removeWhere((Pipes pipes) => pipes.isVisible == false);

    baseList.forEach((Base base) {
      base.update(t);
    });
    //on suprime de la liste les bases qui ne sont plus visbles
    baseList.removeWhere((Base base) => base.isVisible == false);
    //on regarde s'il y reste 1 base, on en crée un autre
    if (baseList.length < 2) {
      spawnBase();
    }
  }

  void spawnBase() {
    baseList = [];
    var firstBase = Base(game: this, x_pos: 0);
    var secondBase = Base(game: this, x_pos: screenSize.width);
    baseList.add(firstBase);
    baseList.add(secondBase);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }
}
