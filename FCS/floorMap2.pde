int[] roomColor2 = {130, 130, 130, 130, 130, 130, 130};

void floorMap2() {
  fill(200);
  noStroke();//マップ全体を塗る
  rect(centerX, centerY + floorSize * 2, floorSize * 8, floorSize * 2);
  rect(centerX + floorSize * 2, centerY + floorSize * 4, floorSize * 6, floorSize);

  fill(0);
  strokeWeight(lineWidth);
  stroke(0);
  for (int i = 0; i < 9; i++) {
    lineFunction(i, 2, i, 4);
    if (i > 2) {
      lineFunction(i, 4, i, 5);
    }
  }
  for (int j = 2; j < 5; j++) {
    lineFunction(0, j, 8, j);
  }

  String[] roomName2 = {
    "222\n223\n224", "225\n226\n227", "228\n229\n230",
    "231\n232\n233", "234\n235\n236", "購買", "生協\n事務局"
  };
  int[] xOffsets = {2, 3, 4, 6, 7, 0, 0};
  int[] yOffsets = {3, 3, 3, 3, 3, 2, 3};

  for (int i = 0; i < roomName2.length; i++) {
    roomFunction(roomName2[i], centerX + floorSize * xOffsets[i], centerY + floorSize * yOffsets[i], floorSize, floorSize, roomColor2[i]);
  }

  strokeWeight(lineWidthOutside);
  int[][] borders = {
    {0, 2, 0, 4}, {0, 2, 8, 2}, {0, 4, 2, 4},
    {2, 4, 2, 5}, {2, 5, 8, 5}, {8, 5, 8, 2}
  };
  for (int[] b : borders) {
    lineFunction(b[0], b[1], b[2], b[3]);
  }
  strokeWeight(lineWidth);
}
