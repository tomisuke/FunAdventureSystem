void showAnswerSetup() {
  showAnswerButton1 = new ControlP5(this);
  showAnswerButton2 = new ControlP5(this);
  showAnswerButton3 = new ControlP5(this);
  showAnswerButton1.setFont(font40);
  showAnswerButton2.setFont(font40);
  showAnswerButton3.setFont(font40);
  showAnswerButton1.addButton("next")
    .setLabel("次へ")
    .setPosition(width-180, height-120)
    .setSize(150, 100)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
  showAnswerButton2.addButton("backPicture")
    .setLabel("戻る")
    .setPosition(30, height-120)
    .setSize(150, 100)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
  showAnswerButton3.addButton("result")
    .setLabel("結果へ")
    .setPosition(width-180, height-120)
    .setSize(150, 100)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
}
void sceneShowAnswer() {
  background(255);
  image(questionImage[resultPictureNum], (width-(960*0.8))/2, 0, 960*0.8, height*0.8);
  textSize(100);
  if (judge[resultPictureNum]) {
    //fill(255, 0, 0);
    image(OkokImage, 0, 0,width,height);
    //text("正解!", 100, height-200);
  } else {
    //fill(0, 0, 255);
    image(NonoImage, 0, 0,width,height);
    //text("不正解!", 100, height-200);
  }
  if (resultPictureNum == 0) {
    showAnswerButton2.hide();
  } else if (resultPictureNum == 1) {
    showAnswerButton2.show();
  } else if (resultPictureNum == MAX_SIZE-1) {
    hideAllButton();
    showAnswerButton2.show();
    showAnswerButton3.show();
  } else if (resultPictureNum == MAX_SIZE-2) {
    showAnswerButton1.show();
    showAnswerButton3.hide();
  }
}
