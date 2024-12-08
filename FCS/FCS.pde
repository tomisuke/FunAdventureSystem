import controlP5.*;
ControlP5 homeButton;
ControlP5 selectLevelButton;
PFont font;
PFont font40;

//グローバル変数(グローバル変数は絶対ここに書いて)
int TlabelColor = #696969;//T==タイトルの意
int TchoicedColor = #d3d3d3;
int Tchoicedfore = #d3d3d3;
int TbuttonColor = color(240, 248, 255, 128);
int TbuttonForegroundColor = color(220, 220, 220, 128); //frowMouse
int TbuttonActiveColor = color(169, 169, 169, 128);//pressed
PImage titleImage;
PImage ruleImage;
int titleFontSize = 70;
int subTitle = 50;
int scene;
int id = 10000;
int level = 1;
//クラスの初期化
private ManageQuestion manageQuestion;

void setup() {
  font = createFont("Meiryo",20);
  textFont(font);
  size(1280, 720);
  scene = 0;
  manageQuestion = new ManageQuestion(id, level);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  ruleImage = loadImage("rule.png");
  //各シーンのセットアップ
  titleSetup();
  selectLevelSetup();
  hideAllButton();
  homeButton.show();
}
void draw() {
  //シーン切り換え
  switch(scene) {
  case 0:
    sceneTitle();
    break;
  case 1:
    sceneRule();
    break;
  case 2:
    sceneSelectLevel();
    println("scene=2");
    break;
  case 3:
    manageQuestion.setup();
  }
}
