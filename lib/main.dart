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

  @override
  void initState() {
    super.initState();
    game = serviceLocator<GameAbstract>();
    game.setTimer = _setTimer;

    //todo remove moc
    game.playField.mergeShapeToStack([
      Block(140),
      Block(141),
      Block(150),
      Block(151),

      Block(128),

      Block(130),
//      Block(131),
//      Block(132),
//      Block(133),
//      Block(134),
//      Block(135),
      Block(136),
      Block(137),
      Block(138),

      Block(180),
      Block(181),
      Block(182),
      Block(183),
      Block(184),
      Block(185),
      Block(186),
      Block(187),
      Block(188),
//      Block(189),

      Block(140),
      Block(141),
      Block(142),
      Block(143),
//      Block(144),
//      Block(145),
      Block(146),
      Block(147),
      Block(148),

      Block(170),
      Block(171),
      Block(172),
      Block(173),
      Block(174),
      Block(175),
      Block(176),
      Block(177),
      Block(178),
//      Block(179),

      Block(150),
      Block(151),
      Block(152),
      Block(153),
      Block(154),
//      Block(155),
      Block(156),
      Block(157),
      Block(158),





      Block(160),
      Block(161),
      Block(162),
      Block(163),
      Block(164),
      Block(165),
      Block(166),
      Block(167),
      Block(168),
//      Block(169),

      Block(190),
      Block(191),
      Block(192),
      Block(193),
      Block(194),
      Block(195),
      Block(196),
      Block(197),
      Block(198),
//      Block(199),


    ]);
  }

  void _startGame() {
//    setState(() {
//      game.step();
//    });

    _setTimer(400);
  }

  _setTimer(int milliseconds) {
    if (_timer is Timer) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(milliseconds: milliseconds), (Timer t) {
      setState(() {
        game.step();
      });
    });
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
          body: Column(
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
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: _startGame,
                          child: Text('Start'),
                          color: Colors.lightGreenAccent,
                        ),
                        SizedBox(width: 8),
                        FlatButton(
                          onPressed: null,
//                              () {
//                            _runTimer(100);
//                          },
                          child: Icon(Icons.av_timer),
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(width: 8),
                        FlatButton(
                          onPressed: _transformClockwise,
                          child: Icon(Icons.rotate_right),
                          color: Colors.lightBlueAccent,
                        ),
                        SizedBox(width: 8),
                        FlatButton(
                          onPressed: null,
                          child: Icon(Icons.rotate_left),
                          color: Colors.lightBlueAccent,
                          disabledColor: Colors.grey[800],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FlatButton(
                          onPressed: _moveLeft,
                          child: Icon(Icons.arrow_left),
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 8),
                        FlatButton(
                          onPressed: _moveDown,
                          child: Icon(Icons.arrow_drop_down),
                          color: Colors.redAccent[400],
                        ),
                        SizedBox(width: 8),
                        FlatButton(
                          onPressed: _moveRight,
                          child: Icon(Icons.arrow_right),
                          color: Colors.redAccent,
                        ),
                      ],
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
          )),
    );
  }
}
