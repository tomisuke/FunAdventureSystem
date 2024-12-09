int[] roomColor4 = {
  130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130
};

void floorMap4() {
  fill(200);//フロア全体を塗る
  rectFunction(0, 1, 2, 2);
  rectFunction(1, 2, 5, 1);
  rectFunction(1, 2, 1, 6);
  rectFunction(0, 7, 1, 2);
  rectFunction(1, 7, 5, 1);
  rectFunction(2, 8, 4, 1);
  rectFunction(5, 1, 1, 7);
  rectFunction(6, 1, 1, 1);
  rectFunction(2, 4, 6, 2);

  strokeWeight(lineWidth);
  stroke(0);
  for (int i = 2; i < 7; i++) {
    lineFunction(i, 7, i, 9);
    lineFunction(1, i, 2, i);
    lineFunction(1 + i, 4, 1 + i, 6);
  }

  lineFunction(0, 2, 7, 2);
  lineFunction(1, 1, 1, 2);
  lineFunction(3, 2, 3, 3);
  lineFunction(4, 2, 4, 3);
  lineFunction(5, 3, 6, 3);
  lineFunction(2, 5, 8, 5);
  lineFunction(0, 8, 1, 8);
  lineFunction(5, 7, 6, 7);

  String[] roomName4 = {
    "422\n423\n424", "425\n426\n427", "428\n429", "431\n432\n433", "434\n435",
    "講堂", "デルタ", "", "事務局", "483",
    "484", "485", "493", "494", "495"
  };
  int[] xOffset = {2, 3, 4, 6, 7, 0, 5, 6, 0, 2, 3, 4, 2, 3, 4};
  int[] yOffset = {4, 4, 4, 4, 4, 1, 1, 1, 7, 7, 7, 7, 8, 8, 8};
  int[] w = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
  int[] h = {1, 1, 1, 1, 1, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1};

  for (int i = 0; i < roomName4.length; i++) {
    roomFunction(roomName4[i], centerX + floorSize * xOffset[i], centerY + floorSize * yOffset[i],
      floorSize * w[i], floorSize * h[i], roomColor4[i]);
  }

  strokeWeight(lineWidthOutside);
  int[][] borders = {
    {0, 1, 2, 1}, {0, 1, 0, 3}, {0, 3, 1, 3}, {1, 3, 1, 7},
    {1, 7, 0, 7}, {0, 7, 0, 9}, {0, 9, 1, 9}, {1, 9, 1, 8},
    {1, 8, 2, 8}, {2, 8, 2, 9}, {2, 9, 6, 9}, {6, 9, 6, 6},
    {6, 6, 8, 6}, {8, 6, 8, 4}, {8, 4, 6, 4}, {6, 4, 6, 2},
    {6, 2, 7, 2}, {7, 2, 7, 1}, {7, 1, 5, 1}, {5, 1, 5, 2},
    {5, 2, 2, 2}, {2, 2, 2, 1}, {2, 3, 5, 3}, {2, 4, 5, 4},
    {2, 3, 2, 4}, {5, 4, 5, 3}, {2, 6, 5, 6}, {2, 7, 5, 7},
    {2, 6, 2, 7}, {5, 7, 5, 6}
  };
  for (int[] b : borders) {
    lineFunction(b[0], b[1], b[2], b[3]);
  }
  strokeWeight(lineWidth);
}
