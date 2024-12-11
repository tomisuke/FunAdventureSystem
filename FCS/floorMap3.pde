int[] roomColor3 = {
  130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130, 130
};

void floorMap3() {
  fill(200);
  noStroke();
  rect(centerX, centerY, floorSize, floorSize * 9);
  rect(centerX + floorSize, centerY + floorSize * 3, floorSize * 7, floorSize * 6);
  rect(centerX + floorSize * 5, centerY + floorSize * 9, floorSize * 3, floorSize);
  fill(0);
  strokeWeight(lineWidth);
  stroke(0);

  for (int i = 0; i < 9; i++) {
    if (i < 2) {
      lineFunction(i, 0, i, 9);
    } else if (i < 5) {
      lineFunction(i, 3, i, 9);
    } else {
      lineFunction(i, 3, i, 10);
    }
  }
  for (int j = 3; j < 10; j++) {
    lineFunction(0, j, 8, j);
    if (j < 6) {
      lineFunction(0, j - 3, 1, j - 3);
    }
  }
  lineFunction(5, 10, 8, 10);

  String[] roomName3 = {
    "玄関", "ライブ\nラリ", "ミュージ\nアム", "体育館", "医務室\n音スタ",
    "社会\n提携\nセンター", "大講義室", "工房", "エレ工", "365",
    "364", "363", "322\n323\n324", "325\n326\n327",
    "328\n329\n330", "331\n332\n333", "334\n335"
  };
  int[] xOffset = {0, 0, 0, 6, 2, 2, 6, 4, 3, 4, 3, 2, 2, 3, 4, 6, 7};
  int[] yOffset = {6, 0, 7, 7, 8, 7, 5, 7, 7, 5, 5, 5, 4, 4, 4, 4, 4};
  int[] w = {1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
  int[] h = {1, 6, 1, 3, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1};

  for (int i = 0; i < roomName3.length; i++) {
    roomFunction(roomName3[i], centerX + floorSize * xOffset[i], centerY + floorSize * yOffset[i],
      floorSize * w[i], floorSize * h[i], roomColor3[i]);
  }

  strokeWeight(lineWidthOutside);
  int[][] borders = {
    {0, 0, 1, 0}, {1, 0, 1, 3}, {1, 3, 8, 3}, {8, 3, 8, 10},
    {8, 10, 5, 10}, {5, 10, 5, 9}, {5, 9, 0, 9}, {0, 9, 0, 0}
  };
  for (int[] b : borders) {
    lineFunction(b[0], b[1], b[2], b[3]);
  }
  strokeWeight(lineWidth);
}
