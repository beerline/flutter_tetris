import 'dart:math';

import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/i_shape.dart';
import 'package:fluttertetris/game/shapes/j_shape.dart';
import 'package:fluttertetris/game/shapes/l_shape.dart';
import 'package:fluttertetris/game/shapes/o_shape.dart';
import 'package:fluttertetris/game/shapes/s_shape.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/t_shape.dart';
import 'package:fluttertetris/game/shapes/z_shape.dart';

abstract class ShapeCreatorAbstract {
  ShapeAbstract create(PlayFieldAbstract playField);
}

class ShapeCreator implements ShapeCreatorAbstract {
  @override
  ShapeAbstract create(PlayFieldAbstract playField) {
    Random random = Random();
    switch (random.nextInt(7)) { // 7 to generate random 0 - 6
      case 0:
        return SShape();
      case 1:
        return OShape();
      case 2:
        return LShape();
      case 3:
        return IShape();
      case 4:
        return TShape();
      case 5:
        return ZShape();
      case 6:
        return JShape();
    }
  }

}