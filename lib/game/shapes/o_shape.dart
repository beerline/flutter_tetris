import 'package:flutter/material.dart';
import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape.dart';

class OShape extends ShapeAbstract {
  OShape({List<BlockAbstract> blocks, Color color})
      :super( blocks ??
      // todo calculate base on the playField.xSize
      List.from([
        Block(0),
        Block(1),
        Block(10),
        Block(11),
      ]), color);

  @override
  clockwise(PlayFieldAbstract playField) {}

}