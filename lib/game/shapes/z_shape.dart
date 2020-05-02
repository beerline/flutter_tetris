import 'dart:ui';

import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class ZShape extends ShapeAbstract {
  ZShape({List<BlockAbstract> blocks, Color color})
      : super(
            blocks ??
                // todo calculate base on the playField.xSize
                List.from([
                  Block(0),
                  Block(1),
                  Block(11),
                  Block(12),
                ]),
            color);

  @override
  // TODO turning with counting boundaries
  clockwise(PlayFieldAbstract playField) {
    try {
      switch (orientation.current) {
        case EnumShapeOrientation.one:
          blocks = List.from([
            Block(blocks[0].coordinate + 2),
            Block(blocks[1].coordinate + playField.xSize + 1),
            Block(blocks[2].coordinate),
            Block(blocks[3].coordinate + playField.xSize - 1),
          ]);
          break;
        case EnumShapeOrientation.two:
          blocks = List.from([
            Block(blocks[0].coordinate + playField.xSize * 2),
            Block(blocks[1].coordinate + playField.xSize - 1),
            Block(blocks[2].coordinate),
            Block(blocks[3].coordinate - playField.xSize - 1),
          ]);
          break;
        case EnumShapeOrientation.three:
          blocks = List.from([
            Block(blocks[0].coordinate - 2),
            Block(blocks[1].coordinate - playField.xSize - 1),
            Block(blocks[2].coordinate ),
            Block(blocks[3].coordinate - playField.xSize + 1),
          ]);
          break;
        case EnumShapeOrientation.four:
          blocks = List.from([
            Block(blocks[0].coordinate - playField.xSize * 2),
            Block(blocks[1].coordinate - playField.xSize + 1),
            Block(blocks[2].coordinate),
            Block(blocks[3].coordinate + playField.xSize + 1),
          ]);
      }
    } on TurnException {}

    orientation.next();
  }
}
