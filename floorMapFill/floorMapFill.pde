ArrayList<Integer> answerId = new ArrayList<Integer>();//【重要】正誤判定に用いる。
int count=0;
PFont font;
int floorSize=80;//マス目の長さ
int centerX=400;//マップの左上を定める（Ｘ軸）
int centerY=50;//マップの左上を定める（Ｙ軸）
int lineWidth=1;//マップの線の太さ
int lineWidthOutside=3;//マップの線の外枠の太さ
int col=130;//マップのデフォルトの色
int floor=3;//階数切り替え
// 最大サイズ
int MAX_SIZE = 5;

int colorTime;//クリック時の色の濃さ初期値，RGBの濃さの値を担う。
boolean floorColorFill=false;//クリック時に色がつく
boolean stableFill=false;
int kariX, kariY;//クリック時に色を表示する位置
int[][][] clickCount;
boolean resetId=false;
ArrayList<Integer> answerId2[]=new ArrayList[5];

void setup() {
  size(1600, 900);
  //size(1280,720);
  font = createFont("Meiryo", 20);
  textFont(font);
  textAlign(LEFT, TOP);
  clickCount=new int[5][16][20];

  for (int i = 0; i < 5; i++) {
    answerId2[i] = new ArrayList<Integer>();
  }
}

int screen=0;
void draw() {
  if (screen==0) {
    floorDraw();
  }
  if (screen==1) {
  }
}

void floorDraw() {
  background(255);
  if (floor==1) {
    floorMap1();
  } else if (floor==2) {
    floorMap2();
  } else if (floor==3) {
    floorMap3();
  } else if (floor==4) {
    floorMap4();
  } else if (floor==5) {
    floorMap5();
  }
  lines();

  floorMapTap(kariX, kariY);//タップした個所を視覚化する

  for (int i = 0; i < answerId.size(); i++) {
    int id = answerId.get(i);
    int floorId = id / 10000;
    int row = (id / 100) % 100;
    int col = id % 100;

    // 色の設定
    if (floorId == floor) {
      fill(0, 255, 0); // 緑色
      rectFunction(row, col, 1, 1);
    }
  }

  // 選択された座標の表示
  text("選択済み座標: " + answerId.toString(), 100, 100);
}


void mousePressed() {
  floorMousePressed();//Array answerIdに適切な値を入れる関数
}




void keyPressed() {//階数確認用キー
  if (key=='1') {
    floor=1;
  } else if (key=='2') {
    floor=2;
  } else if (key=='3') {
    floor=3;
  } else if (key=='4') {
    floor=4;
  } else if (key=='5') {
    floor=5;
  }
  if (key=='0'&&answerId.size()==MAX_SIZE) {//正誤を判定するボタンと同義
    screen=1;
    println("screen=1");
  }
  if (key == 'c') { // 'c'キーで全選択削除
    clearAllSelections();
  }
}

//全フロア共通，点線
int l1=10;//線の長さ
int l2=8;//線の間の長さ（余白）
int l3=3;//デフォルト２　l1とl2の値によって１～３が入る。
void lines() {
  texts();
  fill(20);
  for (int i=0; i<9; i++) {
    for (int j=0; j<floorSize*10/(l1+l2)+l3; j++) {
      line(centerX+floorSize*i, centerY+(l1+l2)*(j-1),
        centerX+floorSize*i, centerY+(l1+l2)*(j-1)+l2);
    }
  }
  for (int i=0; i<11; i++) {
    for (int j=0; j<floorSize*8/(l1+l2)+l3; j++) {
      line(centerX+(l1+l2)*(j-1), centerY+floorSize*i,
        centerX+(l1+l2)*(j-1)+l2, centerY+floorSize*i);
    }
  }
}

void texts() {//方眼紙の横にあるマス目の数字
  fill(0);
  textAlign(CENTER, CENTER);
  for (int i=20; i>=0; i--) {
    text(i, centerX-2*(l1+l2), centerY+(20-i)*floorSize/2);
  }
  for (int i=0; i<=16; i++) {
    text(i, centerX+i*floorSize/2, centerY+floorSize*10+2*(l1+l2));
  }
  textAlign(LEFT, TOP);
}

//以下，お役立ち関数まとめ
void lineFunction(int x1, int y1, int x2, int y2) {//lineを引く省略のための関数
  line(centerX+floorSize*x1, centerY+floorSize*y1, centerX+floorSize*x2, centerY+floorSize*y2);
}
void roomFunction(String s, int x, int y, int w, int h, int col) {//部屋
  fill(col);//施設
  rect(x, y, w, h);
  textAlign(CENTER, CENTER);
  fill(0);//施設の文字
  text(s, x+w/2, y+h/2);
  textAlign(LEFT, TOP);
}
void rectFunction(int x1, int y1, int x2, int y2) {//rectを省略するための関数
  rect(centerX+floorSize*x1, centerY+floorSize*y1, floorSize*x2, floorSize*y2);
}
