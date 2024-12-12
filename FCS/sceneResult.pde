void resultSetup() {
  resultButton = new ControlP5(this);
  resultButton.setFont(font40);
  int backButtonW = 200, backButtonH = 100;
  resultButton.addButton("back")
    .setLabel("ホームに戻る")
    .setPosition(width/2, height/2+200)
    .setSize(backButtonW, backButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
}
void sceneResult() {
  background(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("Result", width/2, 20);
  textSize(50);
  for (int i = 1; i<=MAX_SIZE; i++) {
    text("問題"+i, width/2-200, 100+80*i);
    if (judge[i-1]) {
      text("正解!", width/2+200, 100+80*i);
    } else {
      text("不正解!", width/2+200, 100+80*i);
    }
  }
}