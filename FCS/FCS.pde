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

import processing.net.*;//serverと通信するためライブラリ

import controlP5.*;
ControlP5 homeButton;
ControlP5 selectLevelButton;
ControlP5 ruleButton;
ControlP5 mapButton;
ControlP5 goTitleButton;
ControlP5 resultButton;
ControlP5 showAnswerButton1;
ControlP5 showAnswerButton2;
ControlP5 showAnswerButton3;

ControlP5 modeAdventureButton;
ControlP5 completeAdventureButton;


ControlP5 f1ButtonHome;
ControlP5 f2ButtonHome;
ControlP5 f3ButtonHome;
ControlP5 f4ButtonHome;
ControlP5 f5ButtonHome;

Gif gif;
Gif titleGif;
Gif fun1;
Gif fun2;

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
PImage bg_oldpaper;//宝の地図の紙っぽい画像 bgはbackgroundの略
PImage qr;//アップロードページに飛ぶようのqrコード

PImage okImage;
PImage noImage;
PImage OkokImage;
PImage NonoImage;
PImage mapBGImage;

int titleFontSize = 70;
int subTitle = 40;
int scene;
int id = 10000;
int level = 1;
//mapのグローバル変数，以下かとう
ArrayList<Integer> answerId = new ArrayList<Integer>();//【重要】正誤判定に用いる。ユーザーが選択した場所を格納
int count=0;
int floorSize=55;//マス目の長さ
int centerX=420;//マップの左上を定める（Ｘ軸）
int centerY=100;//マップの左上を定める（Ｙ軸）
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
boolean sceneChange=false;
ArrayList<Integer> answerId2[]=new ArrayList[5];
boolean[] judge;
int l1=10;//方眼紙のマス目の点線の長さ
int l2=8;//線の間の長さ（余白）
int l3=3;//上より，デフォルトの値は２　l1とl2の値によって１～３が入る。
int answerCount=0;
//クラスの初期化，
//private ManageQuestion manageQuestion;
//ManageQuestion manageQuestion;
//サウンド系
boolean soundFlag = true;
//サーバーと通信するための変数
String serverAddress = "127.0.0.1";//サーバーのアドレス　今回はlocalhost
int serverPort = 5000;//サーバーのポート番号
Client client;//クライアントオブジェクト　これでプロセシングがクライアントになる
int resultPictureNum = 0;

int lastwritetime = 0;//サーバーに送信した時間を記録

String answerComment = "";

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
  OkokImage = loadImage("Okok.png");
  NonoImage = loadImage("Nono.png");
  okImage = loadImage("ok.png");
  noImage = loadImage("niwaka.png");
  bg_oldpaper = loadImage("paper_adventure.png");
  mapBGImage=loadImage("mapBG.png");
  //各シーンのセットアップ
  titleSetup();
  selectLevelSetup();
  ruleSetup();
  mapChoiceSetup();
  resultSetup();
  showAnswerSetup();
  sceneAdventureSetup();
  hideAllButton();
  homeButton.show();
  gif = new Gif (this, "loading.gif");
  titleGif= new Gif (this, "titleA.gif");
  gif.play();
  titleGif.play();
  fun1 = new Gif (this, "fun1.gif");
  fun2 = new Gif (this, "fun2.gif");
  fun1.play();
  fun2.play();
  //setupQuestion();
  //map系
  clickCount=new int[5][16][20];
  for (int i = 0; i < 5; i++) {
    answerId2[i] = new ArrayList<Integer>();
  }
  //サーバーと接続する　初回接続
  connectToServer();
  qr = loadImage("toUploadpage_qr.png");
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
        soundFlag = true;
        if (millis() - loadingStartTime > 500) {
          showLoading = false;
          fileLoad = false;
          resultPictureNum = 0;
          scene = 4;
          bgm.close();
          choiceFloorBGM();
          mapButton.show();
          f1ButtonHome.show();
          f2ButtonHome.show();
          f3ButtonHome.show();
          f4ButtonHome.show();
          f5ButtonHome.show();
          floor = 3;
          isLoading = false;
        }
      }
    }
    break;
  case 4://mapシーン
    sceneChoiceAnswer();
    break;
  case 5:
    sceneShowAnswer();
    break;
  case 6:
    sceneResult();
    break;
  case 7:
    if (!fileLoad) {
      fileLoad=true;
      loadImage();
    }
    sceneAdventure();
    break;
  case 8:
    sceneAdventure_picture();
    break;
  case 9:
    sceneQR();
    fileLoad = false;
    break;
  case 10:
    correctscene();
    break;
  case 11:
    incorrectscene();
    break;
  case 12:
    sceneCountDown();
    break;    
  }
}
