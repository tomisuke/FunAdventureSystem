//ここはCtrlフィーリングP5ゾーン
void mapButton() {//setupに存在
  mapButton=new ControlP5(this);
  mapButton.setFont(font40);
  mapButton.addButton("delete")
    .setLabel("delete")
    .setPosition(1000, 600)
    .setSize(150, 150)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);

  mapButton.addButton("judge")
    .setLabel("judge")
    .setPosition(1200, 600)
    .setSize(150, 150)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
}
