import 'dart:ui';

import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class LShape extends ShapeAbstract {
  LShape(PlayFieldAbstract playField, Color color, {List<BlockAbstract> blocks})
      : super(
          blocks ??
              List.from(
                [
                  Block(0, color),
                  Block(1, color),
                  Block(2, color),
                  Block(playField.xSize, color),
                ],
              ),
        );

  @override
  clockwise(PlayFieldAbstract playField) {
    List<Block> newBlocks;
    switch (orientation.current) {
      case EnumShapeOrientation.one:
//      - - -    3 0 -
//      0 1 2 => - 1 -
//      3 - -    - 2 -
        newBlocks = List.from([
          Block(blocks[0].coordinate - playField.xSize + 1, blocks[0].color),
          Block(blocks[1].coordinate, blocks[0].color),
          Block(blocks[2].coordinate + playField.xSize - 1, blocks[0].color),
          Block(blocks[3].coordinate - playField.xSize * 2, blocks[0].color),
        ]);
        break;
      case EnumShapeOrientation.two:
//      3 0 -    - - 3
//      - 1 - => 2 1 0
//      - 2 -    - - -
        if (canRotateNearBoundRight(1, playField)) {
          newBlocks = List.from([
            Block(blocks[0].coordinate + playField.xSize + 1, blocks[0].color),
            Block(blocks[1].coordinate, blocks[0].color),
            Block(blocks[2].coordinate - playField.xSize - 1, blocks[0].color),
            Block(blocks[3].coordinate + 2, blocks[0].color),
          ]);
        }
        break;
      case EnumShapeOrientation.three:
//      - - 3    - 2 -
//      2 1 0    - 1 -
//      - - -    - 0 3
        newBlocks = List.from([
          Block(blocks[0].coordinate + playField.xSize - 1, blocks[0].color),
          Block(blocks[1].coordinate, blocks[0].color),
          Block(blocks[2].coordinate - playField.xSize + 1, blocks[0].color),
          Block(blocks[3].coordinate + playField.xSize * 2, blocks[0].color),
        ]);
        break;
      case EnumShapeOrientation.four:
//      - 2 -    - - -
//      - 1 -    0 1 2
//      - 0 3    3 - -
        if (canRotateNearBoundLeft(1, playField)) {
          newBlocks = List.from([
            Block(blocks[0].coordinate - playField.xSize - 1, blocks[0].color),
            Block(blocks[1].coordinate, blocks[0].color),
            Block(blocks[2].coordinate + playField.xSize + 1, blocks[0].color),
            Block(blocks[3].coordinate - 2, blocks[0].color),
          ]);
        }
    }
    if (newBlocks != null) {
      ShapeAbstract newShape =
          LShape(playField, blocks.first.color, blocks: newBlocks);
      if (!newShape.detectStackCollision(playField)) {
        blocks = newBlocks;
        orientation.next();
      }
    }
  }
}
