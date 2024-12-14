//全国共通のhomeに戻るボタンができたら，その中に score=0; をねじ込んで，正解数をリセットする。

void hideAllButton() {
  homeButton.hide();
  selectLevelButton.hide();
  ruleButton.hide();
  mapButton.hide();
  resultButton.hide();
  showAnswerButton1.hide();
  showAnswerButton2.hide();
  showAnswerButton3.hide();
  modeAdventureButton.hide();
  completeAdventureButton.hide();
  finishAdventureButton.hide();
  f1ButtonHome.hide();
  f2ButtonHome.hide();
  f3ButtonHome.hide();
  f4ButtonHome.hide();
  f5ButtonHome.hide();
  score=0;
}
void rule() {
  scene = 1;
  hideAllButton();
  ruleButton.show();
  pushSE();
}
void begin() {
  scene = 2;
  hideAllButton();
  selectLevelButton.show();
  //bgm.close();
  //selectLevelBGM();
  pushSE();
}
void back() {
  scene = 0;
  clearAllSelections();
  hideAllButton();
  textAlign(LEFT, TOP);
  homeButton.show();
  backSE();
}
void easy() {
  levelOption = "easy";
  MAX_SIZE = 3;
  judge = new boolean[MAX_SIZE];
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 12;
  hideAllButton();
  pushSE();
  bgm.close();
}
void medium() {
  levelOption = "middle";
  MAX_SIZE = 5;
  judge = new boolean[MAX_SIZE];
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 12;
  hideAllButton();
  pushSE();
  bgm.close();
}
void hard() {
  levelOption = "hard";
  MAX_SIZE = 5;
  judge = new boolean[MAX_SIZE];
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 12;
  hideAllButton();
  pushSE();
  bgm.close();
}
void delete() {
  clearAllSelections();
  ChoiceFloorDeleteSE();
  judgeCancel();
}
void judge() {
  judgeAnswer();
  ChoiceFloorJudgeSE();
  scene = 5;
  hideAllButton();
  showAnswerButton1.show();
}
void next() {
  resultPictureNum++;
  pushSE();
  if (resultPictureNum == 1) {
    showAnswerButton2.show();
  } else if (resultPictureNum == MAX_SIZE-1) {
    hideAllButton();
    showAnswerButton2.show();
    showAnswerButton3.show();
  }
}
void backPicture() {
  resultPictureNum--;
  backSE();
  if (resultPictureNum == 0) {
    showAnswerButton2.hide();
  } else if (resultPictureNum == MAX_SIZE-2) {
    hideAllButton();
    showAnswerButton1.show();
    showAnswerButton2.show();
  }
}
void result() {
  pushSE();
  hideAllButton();
  resultButton.show();
  scene = 6;
}
void easyA() {
  //println("a");
  levelOption = "easy";
  MAX_SIZE = 1;//出題は一枚だけ
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 7;
  //println(scene);
  hideAllButton();
  pushSE();
  bgm.close();
  modeAdventureButton.show();
}

void mediumA() {
  levelOption = "middle";
  MAX_SIZE = 1;//出題は一枚だけ
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 7;
  hideAllButton();
  pushSE();
  bgm.close();
  modeAdventureButton.show();
}

void hardA() {
  levelOption = "hard";
  MAX_SIZE = 1;//出題は一枚だけ
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 7;
  hideAllButton();
  pushSE();
  bgm.close();
  modeAdventureButton.show();
}

void sc_sceneAdventure_picture() {//scはscenechangeの略
  modeAdventureButton.hide();
  completeAdventureButton.show();
  scene = 8;
}

void sc_sceneQR() {
  completeAdventureButton.hide();
  scene = 9;
}
void f1() {
  floor = 1;
  pushSE();
}
void f2() {
  floor = 2;
  pushSE();
}
void f3() {
  floor = 3;
  pushSE();
}
void f4() {
  floor = 4;
  pushSE();
}
void f5() {
  floor = 5;
  pushSE();
}
