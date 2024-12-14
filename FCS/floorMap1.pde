//施設の色付けのみ，「左上→左下」「0→10」になっていますが，気にする必要はないです。

int[] roomColor1 = {130, 130, 130, 130, 130, 130, 130, 130, 130, 130};
String[] roomName1={//文字
  "食堂", "厨房", "出入口", "プレベイ", "122\n123\n124", "125\n126\n127", "128\n129\n130", "131\n132\n133", "アトリエ", "134\n135"
};
int[][] roomPosition1={//{左上のⅹ座標,左上のｙ座標,横の長さ,縦の長さ}
  {0, 0, 1, 3}, {0, 3, 1, 1}, {1, 0, 1, 1}, {2, 0, 3, 1}, {2, 2, 1, 1}, {3, 2, 1, 1}, {3, 2, 1, 1}, {4, 2, 1, 1}, {6, 0, 2, 2}, {6, 2, 1, 1}, {7, 2, 1, 1}
};

void floorMap1() {//これが本体

  fill(200);//マップ全体を塗る
  noStroke();
  rect(centerX, centerY, floorSize*8, floorSize*4);//１階は四角いので楽ができる

  strokeWeight(lineWidth);
  stroke(0);
  drawRooms();//部屋を置く
  drawGrid(8, 4);//縦横に線を引く
  //↑この２つの関数を入れ替えると，施設の上に線が来るか，後ろで線が隠れるかが変わる。

  fill(0);//外枠の線
  strokeWeight(lineWidthOutside);
  lineFunction(0, 0, 8, 0);
  lineFunction(0, 0, 0, 4);
  lineFunction(8, 0, 8, 4);
  lineFunction(8, 4, 0, 4);
  strokeWeight(lineWidth);
}

//以下floorMap1関数に存在

void drawRooms() {
  for (int i = 0; i < roomName1.length; i++) {
    int[] pos = roomPosition1[i];
    roomFunction(roomName1[i], centerX + floorSize * pos[0], centerY + floorSize * pos[1], floorSize * pos[2], floorSize * pos[3], roomColor1[i]);
  }
}
void drawGrid(int cols, int rows) {
  for (int i = 0; i <= cols; i++) {
    line(centerX + floorSize * i, centerY, centerX + floorSize * i, centerY + floorSize * rows);
  }
  for (int j = 0; j <= rows; j++) {
    line(centerX, centerY + floorSize * j, centerX + floorSize * cols, centerY + floorSize * j);
  }
}
