void resultSetup() {
  resultButton = new ControlP5(this);
  resultButton.setFont(font40);
  int backButtonW = 200, backButtonH = 100;
  resultButton.addButton("backHome")
    .setLabel("ホームに戻る")
    .setPosition(width/2, height/2)
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
  text("Result", 20, 20);
}
