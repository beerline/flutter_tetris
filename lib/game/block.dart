import 'package:flutter/material.dart';
import 'package:fluttertetris/game/coordinte.dart';

abstract class BlockAbstract {
  int coordinate;
  Color color;

  BlockAbstract(this.coordinate, this.color);

}

class Block extends BlockAbstract {
  Block(int coordinate, Color color) : super(coordinate, color );
}
