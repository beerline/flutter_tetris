import 'package:flutter/material.dart';
import 'package:fluttertetris/game/block.dart';

abstract class PlayFieldAbstract {
  final int xSize;
  final int ySize;
  final Color colorBackGroundBlock;
  Map<int, Block> blocks = {};

  PlayFieldAbstract(this.xSize, this.ySize, this.colorBackGroundBlock);

  mergeShapeToStack(List<BlockAbstract> blocks);
  removeLinesFromStack();
  Map<int, Block> detectBurningLines();

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
  Map<int, Block> detectBurningLines() {

    return null;
  }

  @override
  mergeShapeToStack(List<BlockAbstract> blocks) {
    blocks.forEach((block) {
      this.blocks[block.coordinate] = block;
    });
  }

  @override
  removeLinesFromStack() {
    // TODO: implement removeLinesFromStack
    return null;
  }
}
