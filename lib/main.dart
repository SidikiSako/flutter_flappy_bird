import 'package:flame/util.dart';
import 'package:flappy/flappy_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
  final FlappyGame flappyGame = FlappyGame();
  runApp(flappyGame.widget);
}
