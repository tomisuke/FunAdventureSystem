  import controlP5.*;
//グローバル変数(グローバル変数は絶対ここに書いて)
int scene;
int id = 10000;
int level = 1;
//クラスの初期化
private ManageQuestion manageQuestion;

void setup() {
  size(1920, 1080);
  scene = 3;
  manageQuestion = new ManageQuestion(id,level);
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
    break;
  case 3:
    manageQuestion.setup();
  }
}
void sceneTitle() {
  textSize(100);
  text("SceneTitle",100,100);
  println("SceneTitle");
}
