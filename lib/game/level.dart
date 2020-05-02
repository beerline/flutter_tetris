import 'package:fluttertetris/game/game.dart';

abstract class LevelAbstract {
  int _current;

  int get current => _current;

  LevelAbstract(this._current);

  increaseLevel(GameAbstract game);
}

class Level extends LevelAbstract{
  static const BURNING_LINES_LEVEL_STEP = 2;

  Level({int level}) : super(level ?? 0);

  increaseLevel(GameAbstract game){
    if ( ((_current + 1) * BURNING_LINES_LEVEL_STEP) <= game.burnedLines ) {
      _current += 1;
    }
  }
}