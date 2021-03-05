// game operating

import 'dart:async';
import 'dart:math';
import 'package:vibration/vibration.dart';

var gridList = new List<int>(150);
var droppingBlock = new List<int>(4);
var rotatedBlock = new List<int>(4);
int shape=0;
int dir;
int basicPoint;
int score=0;
List newBlocks = [
  [4,14,24,34],
  [4,5,14,24],
  [3,4,14,24],
  [4,5,14,15],
  [4,14,15,25],
  [4,14,15,24],
  [5,14,15,24],
];
List selectList = [];

void init() {
  selectList = [];
  rotatedBlock = [0, 0, 0, 0];
  score = 0;
  for(int i = 0; i<150; i++) {
    gridList[i] = -1;
  }
}

void startGame() {
  init();
  createBlock();
}

bool createBlock() {

  bool endGame = false;

  shape = selectShape();
  for(int i=0; i<droppingBlock.length; i++) {
    droppingBlock[i] = newBlocks[shape][i];
    if(gridList[droppingBlock[i]] != -1) {
      endGame = true;  // false 則結束遊戲
    }
  }

  setBlock();
  if(endGame) {
    return true;
  }
  else {
    dir = 1;
    basicPoint=14;
    return false;
  }
}

int selectShape() {
  if(selectList.length==0){
    selectList = [0, 1, 2, 3, 4, 5, 6];
  }
  // print(selectList.removeAt(Random().nextInt(selectList.length)));
  // print(num);
  return selectList.removeAt(Random().nextInt(selectList.length));
}

void dropping() {
  cleanBlock();
  for(int i=0; i<droppingBlock.length; i++) {
    droppingBlock[i] += 10;
  }
  basicPoint += 10;
  setBlock();
}

void goLeft() {

  bool isLeftOK = true;

  cleanBlock();
  for(int i=0; i<droppingBlock.length; i++) {
    if(droppingBlock[i]%10 == 0 || gridList[droppingBlock[i]-1] != -1) {
      isLeftOK = false;
      break;
    }
  }
  if(isLeftOK) {
    for(int i=0; i<droppingBlock.length; i++) {
      droppingBlock[i] -= 1;
    }
    basicPoint -= 1;
  }
  setBlock();
}

void goRight() {

  bool isRightOK = true;

  cleanBlock();
  for(int i=0; i<droppingBlock.length; i++) {
    if(droppingBlock[i]%10 == 9 || gridList[droppingBlock[i]+1] != -1) {
      isRightOK = false;
      break;
    }
  }
  if(isRightOK) {
    for(int i=0; i<droppingBlock.length; i++) {
      droppingBlock[i] += 1;
    }
    basicPoint += 1;
  }
  setBlock();
}

void rotate() {
  cleanBlock();
  // I
  if(shape==0) {
    if(dir==0) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+10;
      rotatedBlock[3] = basicPoint+20;
    }
    else if(dir==1) {
      rotatedBlock[0] = basicPoint-1;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+1;
      rotatedBlock[3] = basicPoint+2;
    }
    else if(dir==2) {
      rotatedBlock[0] = basicPoint-9;
      rotatedBlock[1] = basicPoint+1;
      rotatedBlock[2] = basicPoint+11;
      rotatedBlock[3] = basicPoint+21;
    }
    else if(dir==3) {
      rotatedBlock[0] = basicPoint+9;
      rotatedBlock[1] = basicPoint+10;
      rotatedBlock[2] = basicPoint+11;
      rotatedBlock[3] = basicPoint+12;
    }
  }
  // J
  if(shape==1) {
    if(dir==0) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint-9;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==1) {
      rotatedBlock[0] = basicPoint-1;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+1;
      rotatedBlock[3] = basicPoint+11;
    }
    else if(dir==2) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+9;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==3) {
      rotatedBlock[0] = basicPoint-11;
      rotatedBlock[1] = basicPoint-1;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+1;
    }
  }
  // L
  if(shape==2) {
    if(dir==0) {
      rotatedBlock[0] = basicPoint-11;
      rotatedBlock[1] = basicPoint-10;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==1) {
      rotatedBlock[0] = basicPoint-9;
      rotatedBlock[1] = basicPoint-1;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+1;
    }
    else if(dir==2) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+10;
      rotatedBlock[3] = basicPoint+11;
    }
    else if(dir==3) {
      rotatedBlock[0] = basicPoint-1;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+1;
      rotatedBlock[3] = basicPoint+9;
    }
  }
  // O : nothing
  // S
  if(shape==4) {
    if(dir==0) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+1;
      rotatedBlock[3] = basicPoint+11;
    }
    else if(dir==1) {
      rotatedBlock[0] = basicPoint;
      rotatedBlock[1] = basicPoint+1;
      rotatedBlock[2] = basicPoint+9;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==2) {
      rotatedBlock[0] = basicPoint-11;
      rotatedBlock[1] = basicPoint-1;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==3) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint-9;
      rotatedBlock[2] = basicPoint-1;
      rotatedBlock[3] = basicPoint;
    }
  }
  // T
  if(shape==5) {
    if(dir==0) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+1;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==1) {
      rotatedBlock[0] = basicPoint-1;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+1;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==2) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint-1;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==3) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint-1;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+1;
    }
  }
  // Z
  if(shape==6) {
    if(dir==0) {
      rotatedBlock[0] = basicPoint-9;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+1;
      rotatedBlock[3] = basicPoint+10;
    }
    else if(dir==1) {
      rotatedBlock[0] = basicPoint-1;
      rotatedBlock[1] = basicPoint;
      rotatedBlock[2] = basicPoint+10;
      rotatedBlock[3] = basicPoint+11;
    }
    else if(dir==2) {
      rotatedBlock[0] = basicPoint-10;
      rotatedBlock[1] = basicPoint-1;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+9;
    }
    else if(dir==3) {
      rotatedBlock[0] = basicPoint-11;
      rotatedBlock[1] = basicPoint-10;
      rotatedBlock[2] = basicPoint;
      rotatedBlock[3] = basicPoint+1;
    }
  }

  // I的特殊情況
  print("dir: $dir");
  print("dropping: $droppingBlock");
  print("rotated: $rotatedBlock");
  if(shape != 3) {
    if(shape == 0) {
      if(basicPoint%10 != 0 && basicPoint%10 != 8 && basicPoint%10 != 9 && !hitted()) {
        for(int i=0; i<droppingBlock.length; i++) {
          droppingBlock[i] = rotatedBlock[i];
        }
        dir = (dir+1)%4;
      }
    }
    else {
      if(basicPoint%10 != 0 && basicPoint%10 != 9 && !hitted()) {
        for(int i=0; i<droppingBlock.length; i++) {
          droppingBlock[i] = rotatedBlock[i];
        }
        dir = (dir+1)%4;
      }
    }
  }

  setBlock();
}

bool landed() {

  bool isLanded = false;

  cleanBlock();
  for(int i=0; i<droppingBlock.length; i++) {
    if(droppingBlock[i]>=140 || gridList[droppingBlock[i]+10]!=-1) {
      isLanded = true;
      break;
    }
  }
  setBlock();
  if(isLanded) {
    return true;
  }
  else {
    return false;
  }
}

bool hitted() {

  bool isHitted = false;

  for(int i=0; i<rotatedBlock.length; i++) {
    if(rotatedBlock[i]>=150 || gridList[rotatedBlock[i]]!=-1) {
      isHitted = true;
      break;
    }
  }
  if(isHitted) {
    return true;
  }
  else {
    return false;
  }
}

void cleanBlock() {
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = -1;
  }
}

void setBlock() {
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = shape;
  }
}

void crashLine() async {

  List rows = [];
  int lineNumber=0;

  for(int i=0; i<droppingBlock.length; i++) {
    int row = (droppingBlock[i] / 10).floor();
    if(!rows.contains(row)) {
      rows.add(row);
    }
  }
  rows.sort();

  for(int i=0; i<rows.length; i++) {
    bool isLine = true;
    for (int j = 0; j < 10; j++) {
      if (gridList[(rows[i] * 10 + j)] == -1) {
        isLine = false;
        break;
      }
    }
    if (isLine) {
      lineNumber++;
      for (int j = 0; j < 10; j++) {
        gridList[(rows[i] * 10 + j)] = -1; // 清掉連線
      }
      for (int k = rows[i] - 1; k >= 0; k--) {
        for (int j = 0; j < 10; j++) {
          gridList[k * 10 + j + 10] = gridList[k * 10 + j]; // 上面所有排往下移
          gridList[k * 10 + j] = -1;
        }
      }
    }
  }

  if(lineNumber>0) {
    countScore(lineNumber);
    if(await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: 50);
    }
  }
}

void countScore(int line) {
  if(line==1) {
    score += 100;
  }
  else if(line==2) {
    score += 200;
  }
  else if(line==3) {
    score += 400;
  }
  else if(line==4) {
    score += 800;
  }
}