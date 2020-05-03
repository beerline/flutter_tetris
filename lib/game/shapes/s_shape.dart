import 'package:flutter/material.dart';
import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class SShape extends ShapeAbstract {
  SShape(PlayFieldAbstract playField, Color color, {List<BlockAbstract> blocks})
      : super(
          blocks ??
              List.from([
                Block(1, color),
                Block(2, color),
                Block(playField.xSize, color),
                Block(playField.xSize + 1, color),
              ]),
        );

  @override
  clockwise(PlayFieldAbstract playField) {
    List<Block> newBlocks;
    switch (orientation.current) {
      case EnumShapeOrientation.one:
//      - 0 1    - 2 -
//      2 3 - => - 3 0
//      - - -    - - 1
        newBlocks = List.from([
          Block(blocks[0].coordinate + playField.xSize + 1, blocks[0].color),
          Block(blocks[1].coordinate + playField.xSize * 2, blocks[0].color),
          Block(blocks[2].coordinate - playField.xSize + 1, blocks[0].color),
          Block(blocks[3].coordinate, blocks[0].color),
        ]);
        break;
      case EnumShapeOrientation.two:
//      - 2 -    - - -
//      - 3 0 => - 3 2
//      - - 1    1 0 -
        if (canRotateNearBoundLeft(1, playField)) {
          newBlocks = List.from([
            Block(blocks[0].coordinate + playField.xSize - 1, blocks[0].color),
            Block(blocks[1].coordinate - 2, blocks[0].color),
            Block(blocks[2].coordinate + playField.xSize + 1, blocks[0].color),
            Block(blocks[3].coordinate, blocks[0].color),
          ]);
        }
        break;
      case EnumShapeOrientation.three:
//      - - -    1 - -
//      - 3 2 => 0 3 -
//      1 0 -    - 2 -
        newBlocks = List.from([
          Block(blocks[0].coordinate - playField.xSize - 1, blocks[0].color),
          Block(blocks[1].coordinate - playField.xSize * 2, blocks[0].color),
          Block(blocks[2].coordinate + playField.xSize - 1, blocks[0].color),
          Block(blocks[3].coordinate, blocks[0].color),
        ]);
        break;
      case EnumShapeOrientation.four:
//      1 - -    - 0 1
//      0 3 - => 2 3 -
//      - 2 -    - - -
        if (canRotateNearBoundRight(1, playField)) {
          newBlocks = List.from([
            Block(blocks[0].coordinate - playField.xSize + 1, blocks[0].color),
            Block(blocks[1].coordinate + 2, blocks[0].color),
            Block(blocks[2].coordinate - playField.xSize - 1, blocks[0].color),
            Block(blocks[3].coordinate, blocks[0].color),
          ]);
        }
    }

    if (newBlocks != null) {
      ShapeAbstract newShape =
          SShape(playField, blocks.first.color, blocks: newBlocks);
      if (!newShape.detectStackCollision(playField)) {
        blocks = newBlocks;
        orientation.next();
      }
    }
  }
}
