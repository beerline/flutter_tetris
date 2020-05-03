import 'dart:math';

import 'package:flutter/cupertino.dart';
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
    var color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    ShapeAbstract shape;
    switch (random.nextInt(7)) {
      // 7 to generate random 0 - 6
      case 0:
        shape = SShape(playField, color);
        shape.moveRight(playField, blockCount: (playField.xSize / 2).floor() - 1 );
        break;
      case 1:
        shape = OShape(playField,  color);
        shape.moveRight(playField, blockCount: (playField.xSize / 2).floor() - 1);
        break;
      case 2:
        shape = LShape(playField, color);
        shape.moveRight(playField, blockCount: (playField.xSize / 2).floor() - 1 );
        break;
      case 3:
        shape = IShape(playField, color);
        shape.moveRight(
            playField, blockCount: (playField.xSize / 2).floor() - 2);
        break;
      case 4:
        shape = TShape(playField, color);
        shape.moveRight(playField, blockCount: (playField.xSize / 2).floor() - 1);
        break;
      case 5:
        shape = ZShape(playField, color);
        shape.moveRight(playField, blockCount: (playField.xSize / 2).floor() - 1 );
        break;
      case 6:
        shape = JShape(playField, color);
        shape.moveRight(playField, blockCount: (playField.xSize / 2).floor() - 1 );
        break;
    }


    return shape;
  }
}
