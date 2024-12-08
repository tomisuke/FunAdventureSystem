void titleSetup() {//setup内で実行してください
  homeButton = new ControlP5(this);

  font = createFont("Meiryo", 20);
  font40 = createFont("Meiryo", 40);

  //日本語フォントをインストールしてください
  //おしゃれフォントは時間があればのちのちやります

  titleImage = loadImage("title.png");
  homeButton.setFont(font40);
  int titleButtonW =300, titleButtonH = 100;

  homeButton.addButton("begin")
    .setLabel("start")
    .setPosition(0, titleButtonH/2)
    .setSize(titleButtonW, titleButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);

  homeButton.addButton("rule")
    .setLabel("rule")
    .setPosition(0, titleButtonH*2)
    .setSize(titleButtonW, titleButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
}

void sceneTitle() {
  image(titleImage, 0, 0, width, height);
  textSize(titleFontSize);
  text("Fun Adventure System", width/3, height/3);
  textSize(subTitle);
  text("あなたは本当に未来大を知っていますか？", width/3, height/2);
  fill(255);
}
