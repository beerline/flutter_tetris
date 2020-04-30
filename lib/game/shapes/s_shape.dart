import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/coordinte.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class SShape extends ShapeAbstract {
  List<BlockAbstract> blocks;

  SShape({blocks})
      : blocks = blocks ?? List.from([
          Block(
            Coordinate(0, [1, 2]),
          ),
          Block(
            Coordinate(1, [0, 1]),
          )
        ]);

  @override
  // TODO turning with counting boundaries
  clockwise(PlayFieldAbstract playField) {
    switch (orientation.current) {
      case EnumShapeOrientation.one:
        blocks = List.from([
          Block(
            Coordinate(
              blocks[0].coordinate.y,
              [blocks[0].coordinate.xs[0]],
            ),
          ),
          Block(
            Coordinate(
              blocks[1].coordinate.y,
              [blocks[1].coordinate.xs[1], blocks[0].coordinate.xs[1]],
            ),
          ),
          Block(
            Coordinate(
              blocks[1].coordinate.y + 1,
              [blocks[0].coordinate.xs[1]],
            ),
          ),
        ]);
        break;
      case EnumShapeOrientation.two:
        blocks = List.from([
          Block(
            Coordinate(
              blocks[1].coordinate.y,
              [blocks[1].coordinate.xs[0], blocks[1].coordinate.xs[1]],
            ),
          ),
          Block(
            Coordinate(
              blocks[2].coordinate.y,
              [blocks[1].coordinate.xs[0] - 1, blocks[1].coordinate.xs[0]],
            ),
          ),
        ]);
        break;
      case EnumShapeOrientation.three:
        blocks = List.from([
          Block(
            Coordinate(
              blocks[0].coordinate.y - 1,
              [blocks[1].coordinate.xs[0]],
            ),
          ),
          Block(
            Coordinate(
              blocks[0].coordinate.y,
              [blocks[1].coordinate.xs[0], blocks[1].coordinate.xs[1]],
            ),
          ),
          Block(
            Coordinate(
              blocks[1].coordinate.y,
              [blocks[1].coordinate.xs[1]],
            ),
          ),
        ]);
        break;
      case EnumShapeOrientation.four:
        blocks = List.from([
          Block(
            Coordinate(
              blocks[0].coordinate.y,
              [blocks[0].coordinate.xs[0] + 1, blocks[0].coordinate.xs[0] + 2],
            ),
          ),
          Block(
            Coordinate(
              blocks[1].coordinate.y,
              [blocks[1].coordinate.xs[0], blocks[1].coordinate.xs[1]],
            ),
          ),
        ]);
    }

    orientation.next();
  }

  @override
  bool detectCollision(PlayFieldAbstract playField) {
    // TODO: implement detectCollision
    return null;
  }

  @override
  moveDown() {
    blocks.forEach((b) {
      b.coordinate = Coordinate(b.coordinate.y + 1, b.coordinate.xs);
    });
  }
}
