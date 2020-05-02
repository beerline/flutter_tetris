import 'package:fluttertetris/game/level.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/scores.dart';
import 'package:fluttertetris/game/shapes/o_shape.dart';
import 'package:fluttertetris/game/shapes/s_shape.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/speed.dart';

abstract class GameAbstract {
  final PlayFieldAbstract playField;
  LevelAbstract level;
  final SpeedAbstract speed;
  final ScoreAbstract score;
  ShapeAbstract playingShape;
  bool needCheckCollision = false;

  GameAbstract(this.playField, this.level, this.speed, this.score);

  step();
  _gameOver();
  _createShape();
}

class Game extends GameAbstract {
  Game(
    PlayFieldAbstract playField,
    LevelAbstract level,
    SpeedAbstract speed,
    ScoreAbstract score,
  ) : super(playField, level, speed, score);




  @override
  step() {
    // TODO: implement step
    if (playingShape == null) { // in game
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
    // if game over
      // gameOver // game
  }

  _collisionHandle(){
    if (playingShape.detectStackCollision(playField)) {
      playField.mergeShapeToStack(playingShape.blocks);
      playingShape = null;

      var burnedLines = playField.detectBurningLines();

      if (burnedLines.length > 0 ) {
         playField.removeLinesFromStack(burnedLines);
         score.setScore(burnedLines.length, level.current);
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
    // TODO randomize shape creating
    // TODO position in center
    playingShape = OShape();
  }


}
