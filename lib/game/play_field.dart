import 'package:flutter/material.dart';
import 'package:fluttertetris/game/ui_elements/brick.dart';

abstract class PlayFieldAbstract {
  final int xSize;
  final int ySize;
  final Color colorBackGroundBlock;
  Map<int, Brick> bricks;

  PlayFieldAbstract(this.xSize, this.ySize, this.colorBackGroundBlock);

  mergeShapeToStack();
  removeLinesFromStack();
  bool detectBurningLines();

}

class PlayField extends PlayFieldAbstract {
  PlayField({
    int xSize,
    int ySize,
    Color colorBackGroundBlock,
  }) : super(
          // TODO роверять что количество блоков по X ратно блокам по Y
          xSize ?? 10,
          ySize ?? 20,
          colorBackGroundBlock ??  Colors.grey[850],
        );

  @override
  bool detectBurningLines() {
    // TODO: implement detectBurningLines
    return null;
  }

  @override
  mergeShapeToStack() {
    // TODO: implement mergeShapeToStack
    return null;
  }

  @override
  removeLinesFromStack() {
    // TODO: implement removeLinesFromStack
    return null;
  }
}
