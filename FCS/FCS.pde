
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import gifAnimation.*;

import processing.serial.*;


import controlP5.*;
ControlP5 homeButton;
ControlP5 selectLevelButton;
ControlP5 ruleButton;
ControlP5 mapButton;
ControlP5 goTitleButton;
Gif gif;

PFont font;
PFont font40;
Minim minim;
AudioPlayer se;
AudioPlayer bgm;
//グローバル変数(グローバル変数は絶対ここに書いて)
int TlabelColor = #696969;//T==タイトルの意
int TchoicedColor = #d3d3d3;
int Tchoicedfore = #d3d3d3;
int TbuttonColor = color(240, 248, 255, 150);
int TbuttonForegroundColor = color(220, 220, 220, 150); //frowMouse
int TbuttonActiveColor = color(169, 169, 169, 150);//pressed
int backRectW =1280;
int backRectH = 600;
int defaultButtonColor = color(255, 255, 255, 230);
int defaultForegroundColor = color(227, 232, 237, 230); //frowMouse
int defaultActiveColor = color(186, 196, 206, 230);//pressed
int lines = 70;//整る用の空白　gap的なの
PImage titleImage;
PImage ruleImage;
PImage selectImage;
PImage logoImage1;
PImage logoImage2;
int titleFontSize = 70;
int subTitle = 40;
int scene;
int id = 10000;
int level = 1;
//mapのグローバル変数，以下かとう
ArrayList<Integer> answerId = new ArrayList<Integer>();//【重要】正誤判定に用いる。
int count=0;
int floorSize=60;//マス目の長さ
int centerX=400;//マップの左上を定める（Ｘ軸）
int centerY=50;//マップの左上を定める（Ｙ軸）
int lineWidth=1;//マップの線の太さ
int lineWidthOutside=3;//マップの線の外枠の太さ
int col=130;//マップのデフォルトの色
int floor=3;//階数切り替え
int screen=0;
// 最大サイズ
int colorTime;//クリック時の色の濃さ初期値，RGBの濃さの値を担う。
int score=0;//【重要】正解数です
boolean floorColorFill=false;//クリック時に色がつく
boolean stableFill=false;
int kariX, kariY;//クリック時に色を表示する位置
int[][][] clickCount;
boolean resetId=false;
ArrayList<Integer> answerId2[]=new ArrayList[5];
//boolean[] judge=new boolean[MAX_SIZE];
int l1=10;//方眼紙のマス目の点線の長さ
int l2=8;//線の間の長さ（余白）
int l3=3;//上より，デフォルトの値は２　l1とl2の値によって１～３が入る。
int answerCount=0;
//クラスの初期化，
//private ManageQuestion manageQuestion;
//ManageQuestion manageQuestion;
//サウンド系
boolean soundFlag = true;
void setup() {
  scene = 0;
  font = createFont("Meiryo", 20);
  textFont(font);
  size(1280, 720);
  //manageQuestion = new ManageQuestion(id, level);
  minim = new Minim(this);
  titleBGM();
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  ruleImage = loadImage("rule.png");
  //各シーンのセットアップ
  titleSetup();
  selectLevelSetup();
  ruleSetup();
  mapButton();
  hideAllButton();
  homeButton.show();
  gif = new Gif (this, "loading.gif");
  gif.play();
  //setupQuestion();
  //map系
  clickCount=new int[5][16][20];
  for (int i = 0; i < 5; i++) {
    answerId2[i] = new ArrayList<Integer>();
  }
}

void draw() {
  //シーン切り換え
  switch(scene) {
  case 0:
    sceneTitle();
    //selectQuestion();
    break;
  case 1:
    sceneRule();
    break;
  case 2:
    sceneSelectLevel();
    break;
  case 3:
    if (!fileLoad) {
      fileLoad=true;
      loadImage();
    }
    if (fileLoad&&!isLoading) {
      drawQuestion();
    }
    if (displayFin) {
      if (!showLoading) {
        showLoading=true;
        loadingStartTime=millis();
      } else {
        drawLoadingAnimation();
        isLoading = true;
        if (millis() - loadingStartTime > 1000) {
          showLoading = false;
          fileLoad = false;
          scene = 4;
          bgm.close();
          choiceFloorBGM();
          isLoading = false;
        }
      }
    }
    break;
  case 4://mapシーン
    sceneChoiceAnswer();
    break;
  }
}
