import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/coordinte.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class TurnException implements Exception {}

class SShape extends ShapeAbstract {
  List<BlockAbstract> blocks;

  SShape({blocks})
      : blocks = blocks ??
            List.from([
              Block(8),
              Block(9),
              Block(12),
              Block(13),
            ]);

  @override
  // TODO turning with counting boundaries
  clockwise(PlayFieldAbstract playField) {
    try {
      switch (orientation.current) {
        case EnumShapeOrientation.one:
          blocks = List.from([
            Block(blocks[0].coordinate + 6),
            Block(blocks[1].coordinate + 10),
            Block(blocks[2].coordinate - 4),
            Block(blocks[3].coordinate),
          ]);
          break;
        case EnumShapeOrientation.two:
          blocks = List.from([
            Block(blocks[0].coordinate + 4),
            Block(blocks[1].coordinate - 2),
            Block(blocks[2].coordinate + 6),
            Block(blocks[3].coordinate ),
          ]);
          break;
        case EnumShapeOrientation.three:
          blocks = List.from([
            Block(blocks[0].coordinate - 6),
            Block(blocks[1].coordinate -10),
            Block(blocks[2].coordinate + 4),
            Block(blocks[3].coordinate),
          ]);
          break;
        case EnumShapeOrientation.four:
          blocks = List.from([
            Block(blocks[0].coordinate - 4),
            Block(blocks[1].coordinate + 2),
            Block(blocks[2].coordinate - 6),
            Block(blocks[3].coordinate),
          ]);
      }
    } on TurnException {}

    orientation.next();
  }

  @override
  bool detectCollision(PlayFieldAbstract playField) {
    // TODO: implement detectCollision
    return null;
  }

  @override
  moveDown(int contBricksOnX) {
    blocks.forEach((b) {
      b.coordinate += contBricksOnX ;
    });
  }
}
