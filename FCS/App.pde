//全国共通のhomeに戻るボタンができたら，その中に score=0; をねじ込んで，正解数をリセットする。

void rule() {
  scene = 1;
  hideAllButton();
  ruleButton.show();
  pushSound();
}
void begin() {
  scene = 2;
  hideAllButton();
  selectLevelButton.show();
  pushSound();
}
void back() {
  scene = 0;
  hideAllButton();
  homeButton.show();
  textAlign(LEFT, TOP);
  backSound();
}
void hideAllButton() {
  homeButton.hide();
  selectLevelButton.hide();
  ruleButton.hide();
  mapButton.hide();
  score=0;
}
void easy() {
  levelOption = "easy";
  MAX_SIZE = 3;
  scene = 3;
  hideAllButton();
  mapButton.show();
  pushSound();
}
void medium() {
  levelOption = "middle";
  MAX_SIZE = 5;
  scene = 3;
  hideAllButton();
  mapButton.show();
  pushSound();
}
void hard() {
  levelOption = "hard";
  MAX_SIZE = 7;
  scene = 3;
  hideAllButton();
  mapButton.show();
  pushSound();
}
void delete() {
  clearAllSelections();
  judgeCancel();
}
void judge() {
  //judgeAnswer();
}
