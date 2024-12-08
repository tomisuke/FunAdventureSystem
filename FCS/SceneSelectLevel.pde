//難易度選択
void sceneSelectLevel() {
    background(255);
    textSize(100);
    fill(0);
    text("SceneLevelSelect",100,100);
    println("SceneLevelSelect");
    //難易度を選択するボタン
    int easyButtonW = 400, easyButtonH = 200;
    //easybutton
    homeButton = new ControlP5(this);
    homeButton.setFont(font40);
    homeButton.addButton("easy")
       .setLabel("easy")
       .setPosition(width / 2 - easyButtonW / 2, height / 3)
       .setSize(easyButtonW, easyButtonH)
       .setColorCaptionLabel(TlabelColor)
       .setColorBackground(TbuttonColor)
       .setColorLabel(TlabelColor)
       .setColorForeground(TbuttonForegroundColor)
       .setColorActive(TbuttonActiveColor);
}
