// playground hi

import 'dart:async';
import 'package:flutter/material.dart';
import 'game.dart';
import 'grid.dart';
import 'package:vibration/vibration.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget grid;
  bool isButtonDisable = false;

  @override
  void initState() {
    init();
    grid = getGrid();
    super.initState();
  }

  void timer() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if(landed()) {
          crashLine();
          if(createBlock()) {
            print("game over!");
            dir = 0;
            timer.cancel();
            showEndDialog();
          }
        }
        else {
          dropping();
        }
        grid = getGrid();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            // 分數區
            Expanded(
                flex: 1,
                child: Center(child: Text("score : $score", style: TextStyle(color: Colors.white, fontSize: 20),))
            ),
            // 方塊區，寬10格，高20格
            Expanded(
                flex: 15,
                child: grid,
            ),
            // 按鈕區
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 開始遊戲
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.black,
                      child: FlatButton(
                          onPressed: () {
                            if (!isButtonDisable) {
                              isButtonDisable = true;
                              startGame();
                              timer();
                            }
                          },
                          child: Center(child: Text("PLAY", style: TextStyle(color: Colors.white, fontSize: 20)))),
                    ),
                  ),
                  // 左移
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.black,
                      child: FlatButton(
                          onPressed: () async {
                            goLeft();
                            if (await Vibration.hasCustomVibrationsSupport()) {
                              Vibration.vibrate(duration: 10);
                            }
                          },
                          child: Center(child: Icon(Icons.chevron_left, color: Colors.white, size: 30,))),
                    ),
                  ),
                  // 右移
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.black,
                      child: FlatButton(
                          onPressed: () async {
                            goRight();
                            if (await Vibration.hasCustomVibrationsSupport()) {
                              Vibration.vibrate(duration: 10);
                            }
                          },
                          child: Center(child: Icon(Icons.chevron_right, color: Colors.white, size: 30,))),
                    ),
                  ),
                  // 順時針轉90度
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.black,
                      child: FlatButton(
                          onPressed: () async {
                            rotate();
                            if (await Vibration.hasCustomVibrationsSupport()) {
                              Vibration.vibrate(duration: 20);
                            }
                          },
                          child: Center(child: Icon(Icons.rotate_right_outlined, color: Colors.white, size: 30,))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showEndDialog() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: 200);
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext) {
        return AlertDialog(
          title: Text("score : $score"),
          actions: [
            FlatButton(
                onPressed: () {
                  startGame();
                  timer();
                  Navigator.of(context).pop();
                },
                child: Text("Play again"),
            ),
          ],
        );
      }
    );
  }
}
