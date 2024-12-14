void choiceFloorHome() {
  fill(255);
  f1ButtonHome = new ControlP5(this);
  f2ButtonHome = new ControlP5(this);
  f3ButtonHome = new ControlP5(this);
  f4ButtonHome = new ControlP5(this);
  f5ButtonHome = new ControlP5(this);
  f1ButtonHome.setFont(font40);
  f2ButtonHome.setFont(font40);
  f3ButtonHome.setFont(font40);
  f4ButtonHome.setFont(font40);
  f5ButtonHome.setFont(font40);
  
  int floorButtonW = 300, floorButtonH = height/5;
  f5ButtonHome.addButton("f5")
    .setLabel("5F")
    .setPosition(0, 0)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);

  f4ButtonHome.addButton("f4")
    .setLabel("4F")
    .setPosition(0, floorButtonH)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);

  f3ButtonHome.addButton("f3")
    .setLabel("3F")
    .setPosition(0, floorButtonH*2)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
  f2ButtonHome.addButton("f2")
    .setLabel("2F")
    .setPosition(0, floorButtonH*3)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
  f1ButtonHome.addButton("f1")
    .setLabel("1F")
    .setPosition(0, floorButtonH*4)
    .setSize(floorButtonW, floorButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
}
