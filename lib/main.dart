import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/game.dart';
import 'package:fluttertetris/game/ui_elements/game_field.dart';
import 'package:get_it/get_it.dart';
import 'injection_container.dart' as di;

final serviceLocator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  return runApp(TetrisApp());
}

typedef SetTimer = void Function(int milliseconds);

class TetrisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tetris',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(title: 'Flutter Tetris'),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  GameAbstract game;
  Timer _timer;
  int _timerCount = 0;

  @override
  void initState() {
    super.initState();
    game = serviceLocator<GameAbstract>();
  }

  void _startGame() {
    game = serviceLocator<GameAbstract>();
    game.setTimer = _setTimer;
    game.stopTimer = _stopTimer;

    //todo remove moc
    game.playField.mergeShapeToStack([
//      Block(1),
//      Block(11),
//      Block(21),
//      Block(31),
//      Block(41),
//      Block(51),
//      Block(61),
//      Block(71),
//      Block(81),
//      Block(91),
//      Block(101),
//      Block(111),
//      Block(121),
//      Block(131),
//      Block(141),
//      Block(151),
//      Block(161),

//      Block(140),
//      Block(141),
//      Block(150),
//      Block(151),
//
//      Block(128),
//
//      Block(130),
////      Block(131),
////      Block(132),
////      Block(133),
////      Block(134),
////      Block(135),
//      Block(136),
//      Block(137),
//      Block(138),
//
//      Block(180),
      Block(181),
      Block(182),
      Block(183),
      Block(184),
      Block(185),
      Block(186),
      Block(187),
      Block(188),
      Block(189),
//
//      Block(140),
//      Block(141),
//      Block(142),
//      Block(143),
////      Block(144),
////      Block(145),
//      Block(146),
//      Block(147),
//      Block(148),
//
//      Block(170),
      Block(171),
      Block(172),
      Block(173),
      Block(174),
      Block(175),
      Block(176),
      Block(177),
      Block(178),
      Block(179),
//
//      Block(150),
//      Block(151),
//      Block(152),
//      Block(153),
//      Block(154),
////      Block(155),
//      Block(156),
//      Block(157),
//      Block(158),
//
//
//
//
//
//      Block(160),
//      Block(161),
//      Block(162),
//      Block(163),
//      Block(164),
//      Block(165),
//      Block(166),
//      Block(167),
//      Block(168),
////      Block(169),
//
//      Block(190),
      Block(191),
      Block(192),
      Block(193),
      Block(194),
      Block(195),
      Block(196),
      Block(197),
      Block(198),
      Block(199),


    ]);
//    setState(() {
//      game.step();
//    });

    _setTimer(400);
  }

  _setTimer(int milliseconds) {
    _stopTimer();
    _timer = Timer.periodic(Duration(milliseconds: milliseconds), (Timer t) {
      setState(() {
        game.step();
        _timerCount += 1;
      });
    });
  }

  _stopTimer(){
    if (_timer is Timer) {
      _timer.cancel();
    }
  }

  _transformClockwise() {
    setState(() {
      game.playingShape.clockwise(game.playField);
    });
  }

  _transformContrClockwise() {
    setState(() {});
  }

  _moveLeft() {
    setState(() {
      game.playingShape.moveLeft(game.playField);
    });
  }

  _moveRight() {
    setState(() {
      game.playingShape.moveRight(game.playField);
    });
  }

  _moveDown() {
    setState(() {
      game.playingShape.moveDown(game.playField);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: Row(
                    children: <Widget>[
                      Flexible(flex: 3, child: GameField(game)),
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Level = ' + (game.level.current ?? 0).toString(),
                              style: TextStyle(color: Colors.amber, fontSize: 24),
                            ),
                            Text(
                              'Score = ' + (game.score.current ?? 0).toString(),
                              style: TextStyle(color: Colors.amber, fontSize: 24),
                            ),
                            Text(
                              'Lines = ' + (game.burnedLines ?? 0).toString(),
                              style: TextStyle(color: Colors.amber, fontSize: 24),
                            ),
                            Text(
                              'timerCount = $_timerCount' ,
                              style: TextStyle(color: Colors.amber, fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: FlatButton(
                                onPressed: null,
                                child: Icon(Icons.rotate_left),
                                color: Colors.lightBlueAccent,
                                disabledColor: Colors.grey[800],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: FlatButton(
                                  onPressed: _startGame,
                                  child: Text(( _timer != null && _timer.isActive) ? 'Restart' : 'Start'),
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: FlatButton(
                                onPressed: _transformClockwise,
                                child: Icon(Icons.rotate_right),
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: _moveLeft,
                                      child: Icon(Icons.arrow_left, size: 86,),
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      child: FlatButton(
                                        onPressed: _moveDown,
                                        child: Icon(Icons.arrow_drop_down, size: 86,),
                                        color: Colors.redAccent[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: _moveRight,
                                      child: Icon(Icons.arrow_right, size: 86,),
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
