import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class TurnException implements Exception {}

class SShape extends ShapeAbstract {
  List<BlockAbstract> blocks;

  SShape({blocks})
      : blocks = blocks ??
      // todo calculate base on the playField.xSize
      List.from([
        Block(2),
        Block(3),
        Block(11),
        Block(12),
      ]);

  @override
  // TODO turning with counting boundaries
  clockwise(PlayFieldAbstract playField) {
    try {
      switch (orientation.current) {
        case EnumShapeOrientation.one:
          blocks = List.from([
            Block(blocks[0].coordinate + playField.xSize + 1),
            Block(blocks[1].coordinate + playField.xSize * 2),
            Block(blocks[2].coordinate - playField.xSize + 1),
            Block(blocks[3].coordinate),
          ]);
          break;
        case EnumShapeOrientation.two:
          blocks = List.from([
            Block(blocks[0].coordinate + playField.xSize - 1),
            Block(blocks[1].coordinate - 2),
            Block(blocks[2].coordinate + playField.xSize + 1),
            Block(blocks[3].coordinate),
          ]);
          break;
        case EnumShapeOrientation.three:
          blocks = List.from([
            Block(blocks[0].coordinate - playField.xSize - 1),
            Block(blocks[1].coordinate - playField.xSize * 2),
            Block(blocks[2].coordinate + playField.xSize - 1),
            Block(blocks[3].coordinate),
          ]);
          break;
        case EnumShapeOrientation.four:
          blocks = List.from([
            Block(blocks[0].coordinate - playField.xSize + 1),
            Block(blocks[1].coordinate + 2),
            Block(blocks[2].coordinate - playField.xSize - 1),
            Block(blocks[3].coordinate),
          ]);
      }
    } on TurnException {}

    orientation.next();
  }

}
