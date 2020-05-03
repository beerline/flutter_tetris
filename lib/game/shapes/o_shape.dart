import 'package:flutter/material.dart';
import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';

class OShape extends ShapeAbstract {
  OShape(PlayFieldAbstract playField, {List<BlockAbstract> blocks, Color color})
      :super( blocks ??
      // todo calculate base on the playField.xSize
      List.from([
        Block(0, color: color),
        Block(1, color: color),
        Block(playField.xSize, color: color),
        Block(playField.xSize + 1, color: color),
      ]), );

  @override
  clockwise(PlayFieldAbstract playField) {}

}