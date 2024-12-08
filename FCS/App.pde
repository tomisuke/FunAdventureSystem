void rule(){
  println("ルール");
  scene = 1;
  hideAllButton();
}
void begin(){
  println("start");
  scene = 2;
  hideAllButton();
  selectLevelButton.show();
}
void hideAllButton(){
  homeButton.hide();
  selectLevelButton.hide();
}
