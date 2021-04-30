import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flappy/components/base.dart';
import 'package:flappy/components/bg_component.dart';
import 'package:flappy/components/bird.dart';
import 'package:flappy/components/pipes.dart';
import 'package:flame/time.dart';
import 'package:flutter/material.dart';

class FlappyGame extends Game with TapDetector {
  Size screenSize;
  Background background;
  List<Pipes> pipeList = [];
  Timer timer;
  List<Base> baseList;
  Bird bird;

  FlappyGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    background = Background(game: this);

// affichage des pipe à l'aide du timer
    timer = Timer(2, repeat: true, callback: () {
      var newPipes = Pipes(game: this);

      pipeList.add(newPipes);
    });
    timer.start();
    //on affiche les sols
    spawnBase();
    bird = Bird(game: this);
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    pipeList.forEach((pipes) {
      pipes.render(canvas);
    });

    bird.render(canvas);
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

    bird.update(t);
  }

  void spawnBase() {
    baseList = [];
    var firstBase = Base(game: this, xPos: 0);
    var secondBase = Base(game: this, xPos: screenSize.width);
    baseList.add(firstBase);
    baseList.add(secondBase);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    screenSize = size;
  }

  @override
  void onTap() {
    print("on tap dans game");
    super.onTap();
    bird.onTap();
    //bird.isJumping = true;
    //bird.jump();
  }

  void onTapDown(TapDownDetails d) {
    // print("on tap down");
    //bird.onTapDown();
  }

  void onTapUp(TapUpDetails d) {
    // print("on tap Up");
    //bird.onTapUp();
  }
}
