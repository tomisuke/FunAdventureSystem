void rule() {
  println("ルール");
  scene = 1;
  hideAllButton();
  ruleButton.show();
}
void begin() {
  println("start");
  scene = 2;
  hideAllButton();
  selectLevelButton.show();
}
void back() {
  scene = 0;
  hideAllButton();
  homeButton.show();
  textAlign(LEFT,TOP);
}
void hideAllButton() {
  homeButton.hide();
  selectLevelButton.hide();
  ruleButton.hide();
  mapButton.hide();
}
void easy() {
  scene = 4;
  MAX_SIZE = 3;
  hideAllButton();
  mapButton.show();
}
void medium() {
  scene = 4;
  MAX_SIZE = 5;
  hideAllButton();
  mapButton.show();
}
void hard() {
  scene = 4;
  MAX_SIZE = 7;
  hideAllButton();
  mapButton.show();
}

void delete() {
  clearAllSelections();
}
