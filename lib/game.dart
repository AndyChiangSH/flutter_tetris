// game operating

import 'dart:async';
import 'dart:math';

var gridList = new List<int>(150);
List<int> newBlock = [];
int shape=0;
List newBlocks = [
  [4,14,24,34],
  [4,5,14,24],
  [4,5,15,25],
  [4,5,14,15],
  [4,14,15,25],
  [4,14,15,24],
  [5,14,15,24],
];
List<int> droppingBlock = [];

void init() {
  for(int i = 0; i<150; i++) {
    gridList[i] = -1;
  }
}

void startGame() {
  init();
  createBlock();
}

void createBlock() {
  shape = Random().nextInt(6);
  droppingBlock = newBlocks[shape];
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = shape;
  }
}

void dropping() {
  int droppingShape = gridList[droppingBlock[0]];
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = -1;
  }
  for(int i=0; i<droppingBlock.length; i++) {
    droppingBlock[i] += 10;
  }
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = droppingShape;
  }
}

void goLeft() {
  bool isLeftOK = true;
  for(int i=0; i<droppingBlock.length; i++) {
    if(droppingBlock[i]%10 == 0) {
      isLeftOK = false;
    }
  }
  if(isLeftOK) {
    int droppingShape = gridList[droppingBlock[0]];
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = -1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      droppingBlock[i] -= 1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = droppingShape;
    }
  }
}

void goRight() {
  bool isRightOK = true;
  for(int i=0; i<droppingBlock.length; i++) {
    if(droppingBlock[i]%10 == 9) {
      isRightOK = false;
    }
  }
  if(isRightOK) {
    int droppingShape = gridList[droppingBlock[0]];
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = -1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      droppingBlock[i] += 1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = droppingShape;
    }
  }
}

void rotate() {

}