//controlP5をインポートしてください
ControlP5 startButton;
ControlP5 ruleButton;
PFont font;
PFont font40;

int TlabelColor = #696969;//T==タイトルの意
int TchoicedColor = #d3d3d3;
int Tchoicedfore = #d3d3d3;
int TbuttonColor = color(240, 248, 255, 128);
int TbuttonForegroundColor = color(220, 220, 220, 128); //frowMouse
int TbuttonActiveColor = color(169, 169, 169, 128);//pressed
PImage titleImage;
int titleFontSize = 70;
int subTitle = 50;

void titleSetup() {//setup内で実行してください
  startButton = new ControlP5(this);
  ruleButton = new ControlP5(this);

  font = createFont("Meiryo", 20);
  font40 = createFont("Meiryo", 40);
  //日本語フォントをインストールしてください
  //おしゃれフォントは時間があればのちのちやります
  titleImage = loadImage("title.png");
}

void SceneTitle() {
  image(titleImage, 0, 0, width, height);
  textSize(titleFontSize);
  text("Fun Adventure System",width/3,height/3);
  textSize(subTitle);
  text("あなたは本当に未来大を知っていますか？",width/3,height/2);

  fill(255);
  startButton.setFont(font40);
  ruleButton.setFont(font40);
  int titleButtonW =400, titleButtonH = 200;
  startButton.addButton("start")
    .setLabel("start")
    .setPosition(0, titleButtonH/2)
    .setSize(titleButtonW, titleButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);

  ruleButton.addButton("rule")
    .setLabel("rule")
    .setPosition(0, titleButtonH*2)
    .setSize(titleButtonW, titleButtonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(TbuttonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(TbuttonForegroundColor)
    .setColorActive(TbuttonActiveColor);
}
