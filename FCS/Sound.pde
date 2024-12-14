void titleBGM() {
  bgm = minim.loadFile("sound/projectX.mp3");
  bgm.play();
}
void selectLevelBGM() {
  bgm = minim.loadFile("sound/projectX.mp3");
  bgm.play();
}
void choiceFloorBGM() {
  bgm = minim.loadFile("sound/projectX.mp3");
  bgm.play();
}
void backSE() {
  se = minim.loadFile("sound/キャンセル.mp3");
  se.play();
}
void pictureChangeSE() {
  se = minim.loadFile("sound/changePicture.mp3");
  se.play();
}
void pushSE() {
  se = minim.loadFile("sound/爆発.mp3");
  se.play();
}
void choiceFloorSE() {
  se = minim.loadFile("sound/キック.mp3");
  se.play();
}
void choiceFloorCancelSE() {
  se = minim.loadFile("sound/素振り.mp3");
  se.play();
}
void ChoiceFloorOverSE(){
  se = minim.loadFile("sound/カット.mp3");
  se.play();
}
void ChoiceFloorDeleteSE(){
  se = minim.loadFile("sound/KO.mp3");
  se.play();
}
void ChoiceFloorJudgeSE(){
  se = minim.loadFile("sound/ヒット.mp3");
  se.play();
}
void countDownSE(){
  se = minim.loadFile("sound/タイプライター.mp3");
  se.play();
}
