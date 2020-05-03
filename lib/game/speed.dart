import 'package:fluttertetris/game/level.dart';

abstract class SpeedAbstract {

  int getMillisecond(LevelAbstract level) {
    // additionally divide by 2, because moveDown and
    // check collision is in different iteration
    return (getFramesPerCell(level.current) / fps * 1000 / 2).round();
  }

  int get fps;
  int getFramesPerCell(int level);
}

class NesSpeed extends SpeedAbstract {
  static const Map<int, int> levelToFramePearGridCell = {
    0: 48,
    1: 43,
    2: 38,
    3: 33,
    4: 28,
    5: 23,
    6: 18,
    7: 13,
    8: 8,
    9: 6,
    10: 5,
    11: 5,
    12: 5,
    13: 4,
    14: 4,
    15: 4,
    16: 3,
    17: 3,
    18: 3,
    19: 2,
    20: 2,
    21: 2,
    22: 2,
    23: 2,
    24: 2,
    25: 2,
    26: 2,
    27: 2,
    28: 2,
    29: 1,
  };

  @override
  int get fps => 60;

  @override
  int getFramesPerCell(int level) {
    return level <= 29 ? levelToFramePearGridCell[level] : 1;
  }
}

class PalSpeed extends SpeedAbstract {
  static const Map<int, int> levelToFramePearGridCell = {
    0: 36,
    1: 32,
    2: 29,
    3: 25,
    4: 22,
    5: 18,
    6: 15,
    7: 11,
    8: 7,
    9: 5,
    10: 4,
    11: 4,
    12: 4,
    13: 3,
    14: 3,
    15: 3,
    16: 2,
    17: 2,
    18: 2,
    19: 1,
  };

  @override
  int get fps => 50;

  @override
  int getFramesPerCell(int level) {
    return level <= 19 ? levelToFramePearGridCell[level] : 1;
  }
}