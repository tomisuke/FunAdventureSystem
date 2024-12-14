//--Pressed関数はここにある
//マップ表示に関するすべてが入っている
void mapChoiceSetup() {
  mapButton=new ControlP5(this);
  mapButton.setFont(font40);
  mapButton.addButton("delete")
    .setLabel("delete")
    .setPosition(950, 485)
    .setSize(320, 110)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);

  mapButton.addButton("judge")
    .setLabel("judge")
    .setPosition(950, 600)
    .setSize(320, 110)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
  //階を選択するボタン
  f1ButtonHome = new ControlP5(this);
  f2ButtonHome = new ControlP5(this);
  f3ButtonHome = new ControlP5(this);
  f4ButtonHome = new ControlP5(this);
  f5ButtonHome = new ControlP5(this);
  f1ButtonHome.setFont(font40);
  f2ButtonHome.setFont(font40);
  f3ButtonHome.setFont(font40);
  f4ButtonHome.setFont(font40);
  f5ButtonHome.setFont(font40);

  int floorButtonW = 300, floorButtonH = height/5;
  f5ButtonHome.addButton("f5")
    .setLabel("5F")
    .setPosition(0, 0)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);

  f4ButtonHome.addButton("f4")
    .setLabel("4F")
    .setPosition(0, floorButtonH)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);

  f3ButtonHome.addButton("f3")
    .setLabel("3F")
    .setPosition(0, floorButtonH*2)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
  f2ButtonHome.addButton("f2")
    .setLabel("2F")
    .setPosition(0, floorButtonH*3)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
  f1ButtonHome.addButton("f1")
    .setLabel("1F")
    .setPosition(0, floorButtonH*4)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
}
void sceneChoiceAnswer() {//＝void draw，case４に存在
  textFont(font);
  //background(255);
  fill(0);
  image(mapBGImage, 0, 0, width, height);
  image(akimoto,0, 0, width, height);
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


  displayRects();
  displayAnswerId();//{3,1,15}などと画面にうつす,すばら
}


void displayRects() {//複数の選択を視覚化
  for (int i = 0; i < answerId.size(); i++) {
    int id = answerId.get(i);

    ArrayList<Integer> num = numSplit(id);
    int floorId = num.get(0);
    int row = num.get(1);
    int col = num.get(2);

    if (floorId == floor) {
      fill(184, 27, 34, 99);
    } else {
      fill(0, 0, 0, 0);
    }
    rectFunction(row/2, (9-col)/2+5, 1, 1);
  }
}

//以下displayAnswerId関数のためのもの
String numWrite(ArrayList<Integer> num) {
  String result = "";
  for (int i = 0; i < num.size(); i++) {
    result += num.get(i);
    if (i < num.size() - 1) {
      result += ", ";
    }
  }
  return result;
}
ArrayList<Integer> numSplit(int number) {
  ArrayList<Integer> result = new ArrayList<Integer>();
  result.add(number / 10000);
  result.add((number / 100) % 100);
  result.add(number % 100);
  return result;
}
void displayAnswerId() {//sceneChoiseAnswer関数に存在
  int baseX = 60;//座標のいち，ｘ座標
  int baseY = 80;//ｙ座標（１つめ）
  //int currentY=baseY;
  fill(255);
  int gap = 57;
  textSize(45);
  for (int id : answerId) {//answerIdから要素をもらって分割する
    ArrayList<Integer> num = numSplit(id);
    text("{" + numWrite(num) + "}", width-baseX*5, baseY);
    baseY += gap;
  }
  textSize(40);
}


void mousePressed() {
  switch(scene) {
  case 4://mapシーン
    floorMousePressed();//Array answerIdに適切な値を入れる関数
    break;
  }
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
  }
  if (key == 'c') { // 'c'キーで全選択削除
    clearAllSelections();
  }
}

//全フロア共通，点線
void lines() {//sceneChoiseAnswer関数に存在
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
