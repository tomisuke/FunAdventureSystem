//ルール説明のシーン
void ruleSetup() {
  ruleButton = new ControlP5(this);
  ruleButton.setFont(font40);
  int backButtonW = 50, backButtonH = 50;
  ruleButton.addButton("back")
    .setLabel("←")
    .setPosition(50, 20)
    .setSize(backButtonW, backButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
}
void sceneRule() {
  textAlign(CENTER, CENTER);
  image(ruleImage, 0, 0, width, height);
  textSize(50);
  noStroke();
  fill(255, 255, 255, 200);
  rect(0, (height - backRectH)/2, backRectW, backRectH);
  fill(50);
  text("Fun Adventure System", width/2, height/2-lines*3);
  textSize(30);
  fill(100);
  text("スタートボタンを押し、難易度を選択し終えたら\n未来大内のどこかの写真がランダムに表示されます", width/2, height/2-lines);
  text("表示された写真と合致すると思う場所をマップの中から選択してください\n正答数に応じてスコアが加算されます", width/2, height/2+lines/2);
  text("未来大のこと、すっかり分かった気になっていませんか？\n\nさあ、始めましょう\n毎日の記憶を呼び起こして、問題に答えてください", width/2, height/2+lines*5/2);
  fill(0);
}
