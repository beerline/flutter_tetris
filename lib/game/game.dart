import 'package:fluttertetris/game/level.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/scores.dart';
import 'package:fluttertetris/game/speed.dart';

abstract class GameAbstract {
  final PlayFieldAbstract playField;
  LevelAbstract level;
  final SpeedAbstract speed;
  final ScoreAbstract score;

  GameAbstract(this.playField, this.level, this.speed, this.score);

  step();
  gameOver();
}

class Game extends GameAbstract {
  Game(
    PlayFieldAbstract playField,
    LevelAbstract level,
    SpeedAbstract speed,
    ScoreAbstract score,
  ) : super(playField, level, speed, score);

  @override
  _detectCollision() {
    // TODO: implement _detectCollisions
    return null;
  }



  @override
  step() {
    // TODO: implement step

    // if create shape
      // if detectCollision // in shapes
        // if detectBurningLines // in play_field
          // removeLinesFromStack // in play_field
          // addNewEmptyLinesOnTop // ??
        // else
          // mergeShapeToStack // in play_field
      // else
        // moveDown // in shapes
    // else
      // gameOver // game

  }

  @override
  gameOver() {
    // TODO: implement gameOver
    return null;
  }


}
