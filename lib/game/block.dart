import 'package:fluttertetris/game/coordinte.dart';

abstract class BlockAbstract {
  CoordinateAbstract coordinate;

  BlockAbstract(this.coordinate);

}

class Block extends BlockAbstract {
  Block(CoordinateAbstract coordinate) : super(coordinate);
}
