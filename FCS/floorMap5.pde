int[] roomColor5 = {
  130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130
};

void floorMap5() {
  fill(200);
  rectFunction(0, 1, 2, 5);
  rectFunction(0, 7, 1, 2);
  rectFunction(1, 5, 1, 3);
  rectFunction(2, 7, 4, 2);
  rectFunction(5, 9, 3, 1);
  rectFunction(5, 3, 1, 3);
  rectFunction(2, 5, 6, 1);
  rectFunction(5, 9, 3, 1);
  rectFunction(5, 3, 1, 2);
  rectFunction(5, 6, 1, 1);
  rectFunction(2, 4, 6, 1);

  fill(0);
  strokeWeight(lineWidth);
  stroke(0);

  for (int i = 3; i < 8; i++) {
    lineFunction(i, 4, i, 6);
    lineFunction(i - 3, 7, i - 3, 9);
  }
  for (int j = 5; j < 9; j++) {
    lineFunction(0, j, 6, j);
  }
  for (int k = 1; k < 6; k++) {
    lineFunction(0, k, 2, k);
  }

  lineFunction(7, 9, 7, 10);
  lineFunction(6, 9, 6, 10);
  lineFunction(5, 4, 6, 4);
  lineFunction(1, 3, 1, 4);

  String[] roomName5 = {
    "講堂", "コネ\nカフェ", "共同\n研究室", "583", "584",
    "585", "593", "594", "595", "522\n423\n524",
    "525\n526\n427", "528\n529", "531\n532\n533", "534\n535\n536",
    "サ室\n１～３", "４～７", "８～11", "12～15"
  };
  int[] xOffset = {0, 0, 0, 2, 3, 4, 2, 3, 4, 2, 3, 4, 6, 7, 5, 5, 6, 7};
  int[] yOffset = {1, 4, 7, 7, 7, 7, 8, 8, 8, 5, 5, 5, 5, 5, 8, 9, 9, 9};
  int[] w = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
  int[] h = {2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};

  for (int i = 0; i < roomName5.length; i++) {
    roomFunction(roomName5[i], centerX + floorSize * xOffset[i], centerY +  floorSize * yOffset[i],
      floorSize * w[i], floorSize * h[i], roomColor5[i]);
  }
  strokeWeight(lineWidthOutside); // 外枠
  int[][] borders5 = {
    {0, 1, 2, 1}, {2, 1, 2, 4}, {2, 4, 5, 4}, {5, 4, 5, 3},
    {5, 3, 6, 3}, {6, 3, 6, 4}, {6, 4, 8, 4}, {8, 4, 8, 6},
    {8, 6, 6, 6}, {6, 6, 6, 9}, {6, 9, 8, 9}, {8, 9, 8, 10},
    {8, 10, 5, 10}, {5, 10, 5, 9}, {5, 9, 2, 9}, {2, 9, 2, 8},
    {2, 8, 1, 8}, {1, 8, 1, 9}, {1, 9, 0, 9}, {0, 9, 0, 7},
    {0, 7, 1, 7}, {1, 7, 1, 6}, {1, 6, 0, 6}, {0, 6, 0, 1},
    {2, 6, 5, 6}, {2, 7, 5, 7}, {2, 6, 2, 7}, {5, 6, 5, 7}
  };

  for (int[] b : borders5) {
    lineFunction(b[0], b[1], b[2], b[3]);
  }
  strokeWeight(lineWidth);
}
