void titleSetup() {//setup内で実行してください
  homeButton = new ControlP5(this);

  font = createFont("Meiryo", 20);
  font40 = createFont("Meiryo", 40);

  //日本語フォントをインストールしてください
  //おしゃれフォントは時間があればのちのちやります

  logoImage1 = loadImage("logo1.PNG");
  logoImage2 = loadImage("logo2.PNG");
  homeButton.setFont(font40);
  int titleButtonW =250, titleButtonH = 100;

  homeButton.addButton("begin")
    .setLabel("start")
    .setPosition(width/2-150-(titleButtonW/2), height-150)
    .setSize(titleButtonW, titleButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);

  homeButton.addButton("rule")
    .setLabel("rule")
    .setPosition(width/2+150-(titleButtonW/2), height-150)
    .setSize(titleButtonW, titleButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
}

void sceneTitle() {
  image(titleGif, 0, 0, width, height);
  //image(logoImage1, -120, 0, width, height);
  //image(logoImage2, -80, 0, width, height);
  //textSize(titleFontSize);
  //text("Fun Adventure System", width/3, height/3);
  //textSize(subTitle);
  //text("あなたは本当に未来大を知っていますか？", width/3, height/2);
  fill(255);
}
