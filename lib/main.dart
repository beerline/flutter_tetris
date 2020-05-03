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
  }

  void _startGame() {
    game = serviceLocator<GameAbstract>();
    game.setTimer = _setTimer;
    game.stopTimer = _stopTimer;

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
      });
    });
  }

  _stopTimer() {
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
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 24),
                            ),
                            Text(
                              'Score = ' + (game.score.current ?? 0).toString(),
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 24),
                            ),
                            Text(
                              'Lines = ' + (game.burnedLines ?? 0).toString(),
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 24),
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
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: FlatButton(
                                  onPressed: _startGame,
                                  child: Text(
                                      (_timer != null && _timer.isActive)
                                          ? 'Restart'
                                          : 'Start'),
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
                                      onLongPress: _moveLeft,
                                      child: Icon(
                                        Icons.arrow_left,
                                        size: 86,
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      child: FlatButton(
                                        onPressed: _moveDown,
                                        onLongPress: _moveDown,
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          size: 86,
                                        ),
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
                                      onLongPress: _moveRight,
                                      child: Icon(
                                        Icons.arrow_right,
                                        size: 86,
                                      ),
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
