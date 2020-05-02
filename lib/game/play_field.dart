import 'package:flutter/material.dart';
import 'package:fluttertetris/game/block.dart';

abstract class PlayFieldAbstract {
  final int xSize;
  final int ySize;
  final Color colorBackGroundBlock;
  Map<int, Block> blocks = {};

  PlayFieldAbstract(this.xSize, this.ySize, this.colorBackGroundBlock);

  mergeShapeToStack(List<BlockAbstract> blocks);

  removeLinesFromStack(Map<int, List<Block>> lineForRemoving);

  Map<int, List<Block>> detectBurningLines();
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
          colorBackGroundBlock ?? Colors.grey[850],
        );

  @override
  Map<int, List<Block>> detectBurningLines() {
    Map<int, List<Block>> blocksInLine = {};

    blocks.forEach((coordinate, block) {
      final int line = (coordinate / xSize).floor();
      if (blocksInLine.containsKey(line)) {
        blocksInLine[line].add(block);
      } else {
        blocksInLine.addAll({
          line: [block]
        });
      }
    });

    blocksInLine.removeWhere((key, value) => value.length < xSize);

    return blocksInLine;
  }

  @override
  mergeShapeToStack(List<BlockAbstract> blocks) {
    blocks.forEach((block) {
      this.blocks[block.coordinate] = block;
    });
  }

  @override
  removeLinesFromStack(Map<int, List<Block>> lineForRemoving) {
    lineForRemoving.forEach((line, blockList) {
      for (final b in blockList) {
        // remove line
        blocks.remove(b.coordinate);
      }
    });


    // move other blocks down
    lineForRemoving.forEach((line, blockList) {
      Map<int, Block> resBlocks = {};
      blocks.forEach((coordinate, block) {
        if (coordinate < line * xSize) {
          var restBlock = block;
          restBlock.coordinate += xSize;
          resBlocks.addAll({coordinate + xSize: restBlock});
        } else {
          var restBlock = block;
          resBlocks.addAll({coordinate : restBlock});
        }
      });
      blocks = resBlocks;
    });


    return null;
  }
}
