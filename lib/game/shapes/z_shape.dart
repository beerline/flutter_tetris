import 'dart:ui';

import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class ZShape extends ShapeAbstract {
  ZShape(PlayFieldAbstract playField, Color color, {List<BlockAbstract> blocks})
      : super(
          blocks ??
              List.from([
                Block(0, color),
                Block(1, color),
                Block(playField.xSize + 1, color),
                Block(playField.xSize + 2, color),
              ]),
        );

  @override
  clockwise(PlayFieldAbstract playField) {
    List<Block> newBlocks;
    switch (orientation.current) {
//    0 1 -    - - 0
//    - 2 3 => - 2 1
//    - - -    - 3 -
      case EnumShapeOrientation.one:
        newBlocks = List.from([
          Block(blocks[0].coordinate + 2, blocks[0].color),
          Block(blocks[1].coordinate + playField.xSize + 1, blocks[0].color),
          Block(blocks[2].coordinate, blocks[0].color),
          Block(blocks[3].coordinate + playField.xSize - 1, blocks[0].color),
        ]);
        break;
      case EnumShapeOrientation.two:
//      - - 0    - - -
//      - 2 1 => 3 2 -
//      - 3 -    - 1 0
        if (canRotateNearBoundLeft(1, playField)) {
          newBlocks = List.from([
            Block(blocks[0].coordinate + playField.xSize * 2, blocks[0].color),
            Block(blocks[1].coordinate + playField.xSize - 1, blocks[0].color),
            Block(blocks[2].coordinate, blocks[0].color),
            Block(blocks[3].coordinate - playField.xSize - 1, blocks[0].color),
          ]);
        }
        break;
      case EnumShapeOrientation.three:
//      - - -    - 3 -
//      3 2 - => 1 2 -
//      - 1 0    0 - -
        newBlocks = List.from([
          Block(blocks[0].coordinate - 2, blocks[0].color),
          Block(blocks[1].coordinate - playField.xSize - 1, blocks[0].color),
          Block(blocks[2].coordinate, blocks[0].color),
          Block(blocks[3].coordinate - playField.xSize + 1, blocks[0].color),
        ]);
        break;
      case EnumShapeOrientation.four:
//      - 3 -    0 1 -
//      1 2 - => - 2 3
//      0 - -    - - -
        if (canRotateNearBoundRight(1, playField)) {
          newBlocks = List.from([
            Block(blocks[0].coordinate - playField.xSize * 2, blocks[0].color),
            Block(blocks[1].coordinate - playField.xSize + 1, blocks[0].color),
            Block(blocks[2].coordinate, blocks[0].color),
            Block(blocks[3].coordinate + playField.xSize + 1, blocks[0].color),
          ]);
        }
    }

    if (newBlocks != null) {
      ShapeAbstract newShape =
          ZShape(playField, blocks.first.color, blocks: newBlocks);
      if (!newShape.detectStackCollision(playField)) {
        blocks = newBlocks;
        orientation.next();
      }
    }
  }
}
