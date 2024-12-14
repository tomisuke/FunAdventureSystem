//難易度選択
void selectLevelSetup() {
  int SbuttonColor = color(255, 255, 255, 230);
  int SbuttonForegroundColor = color(227, 232, 237, 230); //frowMouse
  int SbuttonActiveColor = color(186, 196, 206, 230);//pressed

  selectImage=loadImage("select.png");
  int easyButtonW = 300, easyButtonH = 100;
  //easybutton
  selectLevelButton = new ControlP5(this);
  selectLevelButton.setFont(font40);
  //地図モードの難易度選択ボタン
  selectLevelButton.addButton("easy")
    .setLabel("easy")
    .setPosition(width / 4 - easyButtonW / 2, height / 3)
    .setSize(easyButtonW, easyButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(SbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(SbuttonForegroundColor)
    .setColorActive(SbuttonActiveColor);

  selectLevelButton.addButton("medium")
    .setLabel("medium")
    .setPosition(width / 4 - easyButtonW / 2, height / 2)
    .setSize(easyButtonW, easyButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(SbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(SbuttonForegroundColor)
    .setColorActive(SbuttonActiveColor);

  selectLevelButton.addButton("hard")
    .setLabel("hard")
    .setPosition(width / 4 - easyButtonW / 2, height*2 / 3)
    .setSize(easyButtonW, easyButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(SbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(SbuttonForegroundColor)
    .setColorActive(SbuttonActiveColor);
  //探検モードの難易度選択ボタン
  selectLevelButton.addButton("easyA")
    .setLabel("easy")
    .setPosition(width*3 / 4 - easyButtonW / 2, height / 3)
    .setSize(easyButtonW, easyButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(SbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(SbuttonForegroundColor)
    .setColorActive(SbuttonActiveColor);

  selectLevelButton.addButton("mediumA")
    .setLabel("medium")
    .setPosition(width*3 / 4 - easyButtonW / 2, height / 2)
    .setSize(easyButtonW, easyButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(SbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(SbuttonForegroundColor)
    .setColorActive(SbuttonActiveColor);
  selectLevelButton.addButton("hardA")
    .setLabel("hard")
    .setPosition(width*3 / 4 - easyButtonW / 2, height*2 / 3)
    .setSize(easyButtonW, easyButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(SbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(SbuttonForegroundColor)
    .setColorActive(SbuttonActiveColor);
}
void sceneSelectLevel() {
  textAlign(CENTER, CENTER);
  image(selectImage, 0, 0, width, height);
  textSize(50);
  noStroke();
  fill(255, 255, 255, 200);
  rect(0, (height - backRectH-10)/2, backRectW, 70);
  rect(161, height/4 - 35, width/4, 70);//テキスト"地図モード"の背景
  rect(161 + width/2, height/4 - 35, width/4, 70);//テキスト"探検モード"の背景
  fill(80);
  text("難易度を選択してください", width/2, height/8);
  //モードのテキスト
  text("地図モード", width/4, height/4);
  text("探検モード", width*3/4, height/4);
  //難易度を選択するボタン
}
