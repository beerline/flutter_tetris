import 'dart:math';

import 'package:fluttertetris/game/level.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/scores.dart';
import 'package:fluttertetris/game/shapes/i_shape.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_creator.dart';
import 'package:fluttertetris/game/speed.dart';
import 'package:fluttertetris/main.dart';

abstract class GameAbstract {
  final PlayFieldAbstract playField;
  LevelAbstract level;
  final SpeedAbstract speed;
  final ScoreAbstract score;
  ShapeAbstract playingShape;
  bool needCheckCollision = false;
  final ShapeCreatorAbstract _shapeCreator;
  int _burnedLines = 0;
  SetTimer setTimer;
  Function stopTimer;

  GameAbstract(
      this.playField, this.level, this.speed, this.score, this._shapeCreator);

  step();

  _gameOver();

  _createShape();

  get burnedLines => _burnedLines;
}

class Game extends GameAbstract {
  Game(
    PlayFieldAbstract playField,
    LevelAbstract level,
    SpeedAbstract speed,
    ScoreAbstract score,
    ShapeCreatorAbstract shapeCreator,
  ) : super(playField, level, speed, score, shapeCreator);

  @override
  step() {
    // TODO: implement step
    if (playingShape == null) {
      _createShape();
    } else {
      if (needCheckCollision) {
        _collisionHandle();
        needCheckCollision = false;
      } else {
        playingShape.moveDown(playField);
        needCheckCollision = true;
      }
    }

     if (_isGameOver()) {
       stopTimer();
       // gameOver
     }
  }

  _collisionHandle() {
    if (playingShape.detectStackCollision(playField)) {
      playField.mergeShapeToStack(playingShape.blocks);
      playingShape = null;

      var burnedLines = playField.detectBurningLines();

      if (burnedLines.length > 0) {
        playField.removeLinesFromStack(burnedLines);
        score.setScore(burnedLines.length, level.current);
        _burnedLines += burnedLines.length;
        level.increaseLevel(this);
        setTimer(speed.getMillisecond(level));
      }
    }
  }

  @override
  _gameOver() {
    // TODO: implement gameOver
    return null;
  }

  @override
  _createShape() {
    // TODO position in center
    playingShape = _shapeCreator.create(playField);
  }

  bool _isGameOver(){
    return (playField.blocks.keys.fold(1000000, min) / playField.xSize).floor() == 0;
  }
}
