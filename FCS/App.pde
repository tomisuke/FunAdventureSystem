void rule(){
  println("ルール");
  scene = 1;
  hideAllButton();
  ruleButton.show();
}
void begin(){
  println("start");
  scene = 2;
  hideAllButton();
  selectLevelButton.show();
}
void back(){
  scene = 0;
  hideAllButton();
  homeButton.show();
}
void hideAllButton(){
  homeButton.hide();
  selectLevelButton.hide();
  ruleButton.hide();
}
