abstract class CoordinateAbstract {
  get y;
  get xs;
}

class Coordinate extends CoordinateAbstract {
  int _y;
  List<int> _xs;

  Coordinate(this._y, this._xs);

  get y => _y;
  get xs => _xs;
}