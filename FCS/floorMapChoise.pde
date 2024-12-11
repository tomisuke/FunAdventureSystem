//マップ選択に関するすべてが入っている
int returnId;//answerIdの仮置き場所
int checkId;
int ans1=floor, ans2, ans3;//左から階数，横列，縦列
int idX, idY;

void floorMapTap(int x, int y) {//sceneChoiceAnswerタブ・関数に存在
  noStroke();
  if (floorColorFill == true) {
    colorTime = colorTime * 99 / 100;
    for (int i = 0; i <= 7; i++) {
      if (x > i * floorSize + centerX && x <= (i + 1) * floorSize + centerX) {
        x = i;
        idX = i;
      }
    }
    for (int j = 0; j <= 9; j++) {
      if (y > j * floorSize + centerY && y <= (j + 1) * floorSize + centerY) {
        y = j;
        idY = j;
      }
    }
    fill(255, 0, 0, colorTime);
    rectFunction(x, y, 1, 1);
  }
  if (colorTime <= 0) {
    floorColorFill = false;
  }
  rectFunction(x, y, 1, 1);
}
void clearAllSelections() {
  answerId.clear(); // すべての選択を削除
  println("全選択を削除しました");
}


void floorMapTapStable(int x, int y) {
  if (stableFill==true) {
    rectFunction(x, y, 1, 1);
  }
}

void floorMousePressed() {
  kariX = mouseX;  // マウスのX座標
  kariY = mouseY;  // マウスのY座標
  colorTime = 40;
  floorMapReturn(idX, idY);  // マップをタップしたときの処理をする関数
  floorColorFill = true;

  // x, y はマップ上での横列、縦列の番号
  int x = -1;
  int y = -1;

  // 横列、縦列をマウス位置から取得
  for (int i = 0; i < 8; i++) {
    if (kariX > i * floorSize + centerX && kariX <= (i + 1) * floorSize + centerX) {
      x = i;
    }
  }
  for (int j = 0; j < 10; j++) {
    if (kariY > j * floorSize + centerY && kariY <= (j + 1) * floorSize + centerY) {
      y = j;
    }
  }

  if (x != -1 && y != -1) {
    floorMapReturn(x, y);

    boolean exists = false;
    for (int i = 0; i < answerId.size(); i++) {
      if (answerId.get(i) == returnId) {
        answerId.remove(i);  // 同じ値が存在した場合削除
        exists = true;
        choiceFloorCancelSE();
        break;
      }
    }

    if (!exists) {
      if (answerId.size() < MAX_SIZE) {
        answerId.add(returnId);  // 最大数に達していなければ新しいIDを追加
        choiceFloorSE();
      }else{
        ChoiceFloorOverSE();
      }
    }

    println(answerId); //確認用
  }
}




void floorMapReturn(int x, int y) {
  ans1 = floor;
  ans2 = 8; // 初期化
  ans3 = 10;

  ans2 = 2 * x + 1; // IDを返すゾーン
  ans3 = 2 * (9 - y) + 1;

  // returnId の計算式
  returnId = ans1 * 10000 + ans2 * 100 + ans3;
}
