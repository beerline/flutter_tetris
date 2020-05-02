import 'dart:ui';

import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class LShape extends ShapeAbstract {
  LShape({List<BlockAbstract> blocks, Color color})
      : super(
      blocks ??
          // todo calculate base on the playField.xSize
          List.from([
            Block(0),
            Block(1),
            Block(2),
            Block(10),
          ]),
      color);

  @override
  clockwise(PlayFieldAbstract playField) {
    try {
      switch (orientation.current) {
        case EnumShapeOrientation.one:
          blocks = List.from([
            Block(blocks[0].coordinate - playField.xSize + 1),
            Block(blocks[1].coordinate ),
            Block(blocks[2].coordinate + playField.xSize - 1),
            Block(blocks[3].coordinate - playField.xSize * 2),
          ]);
          break;
        case EnumShapeOrientation.two:
          blocks = List.from([
            Block(blocks[0].coordinate + playField.xSize + 1),
            Block(blocks[1].coordinate ),
            Block(blocks[2].coordinate - playField.xSize - 1),
            Block(blocks[3].coordinate + 2),
          ]);
          break;
        case EnumShapeOrientation.three:
          blocks = List.from([
            Block(blocks[0].coordinate + playField.xSize - 1),
            Block(blocks[1].coordinate ),
            Block(blocks[2].coordinate - playField.xSize + 1),
            Block(blocks[3].coordinate + playField.xSize * 2),
          ]);
          break;
        case EnumShapeOrientation.four:
          blocks = List.from([
            Block(blocks[0].coordinate - playField.xSize - 1),
            Block(blocks[1].coordinate ),
            Block(blocks[2].coordinate + playField.xSize + 1),
            Block(blocks[3].coordinate - 2),
          ]);
      }
    } on TurnException {}
    orientation.next();
  }
}