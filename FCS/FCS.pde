import controlP5.*;
ControlP5 homeButton;
ControlP5 selectLevelButton;
ControlP5 goButton;
PFont font;
PFont font40;

//グローバル変数(グローバル変数は絶対ここに書いて)
int TlabelColor = #696969;//T==タイトルの意
int TchoicedColor = #d3d3d3;
int Tchoicedfore = #d3d3d3;
int TbuttonColor = color(240, 248, 255, 150);
int TbuttonForegroundColor = color(220, 220, 220, 150); //frowMouse
int TbuttonActiveColor = color(169, 169, 169, 150);//pressed
int backRectW =1280;
int backRectH = 600;
int lines = 70;//整る用の空白　gap的なの
PImage titleImage;
PImage ruleImage;
PImage selectImage;
int titleFontSize = 70;
int subTitle = 40;
int scene;
int id = 10000;
int level = 1;
//クラスの初期化
private ManageQuestion manageQuestion;

void setup() {
  font = createFont("Meiryo", 20);
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
  //goTitle();
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
