// game operating

import 'dart:async';
import 'dart:math';

var gridList = new List<int>(150);
var droppingBlock = new List<int>(4);
var rotatedBlock = new List<int>(4);
int shape=0;
int dir;
int basicPoint;
List newBlocks = [
  [4,14,24,34],
  [4,5,14,24],
  [3,4,14,24],
  [4,5,14,15],
  [4,14,15,25],
  [4,14,15,24],
  [5,14,15,24],
];

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
  dir = 1;
  basicPoint=14;
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = shape;
  }
}

void dropping() {
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = -1;
  }
  for(int i=0; i<droppingBlock.length; i++) {
    droppingBlock[i] += 10;
  }
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = shape;
  }
  basicPoint += 10;
}

void goLeft() {
  bool isLeftOK = true;
  for(int i=0; i<droppingBlock.length; i++) {
    if(droppingBlock[i]%10 == 0) {
      isLeftOK = false;
    }
  }
  if(isLeftOK) {
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = -1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      droppingBlock[i] -= 1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = shape;
    }
    basicPoint -= 1;
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
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = -1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      droppingBlock[i] += 1;
    }
    for(int i=0; i<droppingBlock.length; i++) {
      gridList[droppingBlock[i]] = shape;
    }
    basicPoint += 1;
  }
}

void rotate() {
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

  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = -1;
  }
  // I的特殊情況
  if(shape == 0) {
    if(basicPoint%10 != 0 && basicPoint%10 != 8 && basicPoint%10 != 9 && !isHitted()) {
      droppingBlock = rotatedBlock;
      print(droppingBlock);
      dir = (dir+1)%4;
    }
  }
  else {
    if(basicPoint%10 != 0 && basicPoint%10 != 9 && !isHitted()) {
      droppingBlock = rotatedBlock;
      print(droppingBlock);
      dir = (dir+1)%4;
    }
  }
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = shape;
  }

}

bool landed() {

  bool isLanded = false;

  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = -1;
  }
  for(int i=0; i<droppingBlock.length; i++) {
    if(droppingBlock[i]>=140 || gridList[droppingBlock[i]+10]!=-1) {
      isLanded = true;
      break;
    }
  }
  for(int i=0; i<droppingBlock.length; i++) {
    gridList[droppingBlock[i]] = shape;
  }
  if(isLanded) {
    return true;
  }
  else {
    return false;
  }
}

bool isHitted() {
  for(int i=0; i<rotatedBlock.length; i++) {
    if(rotatedBlock[i]>=150 || gridList[rotatedBlock[i]]!=-1) {
      return true;
    }
  }
  return false;
}