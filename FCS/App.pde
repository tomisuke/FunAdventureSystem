//全国共通のhomeに戻るボタンができたら，その中に score=0; をねじ込んで，正解数をリセットする。

void hideAllButton() {
  homeButton.hide();
  selectLevelButton.hide();
  ruleButton.hide();
  mapButton.hide();
  resultButton.hide();
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
  hideAllButton();
  homeButton.show();
  textAlign(LEFT, TOP);
  backSE();
}
void easy() {
  levelOption = "easy";
  MAX_SIZE = 3;
  judge = new boolean[MAX_SIZE];
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 3;
  hideAllButton();
  pushSE();
  bgm.close();
}
void medium() {
  levelOption = "middle";
  MAX_SIZE = 5;
  judge = new boolean[MAX_SIZE];
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 3;
  hideAllButton();
  pushSE();
  bgm.close();
}
void hard() {
  levelOption = "hard";
  MAX_SIZE = 7;
  judge = new boolean[MAX_SIZE];
  fileName = new String[MAX_SIZE];  //出題する写真の名前
  scene = 3;
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
  resultButton.show();
}
