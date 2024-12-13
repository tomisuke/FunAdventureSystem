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
  //画像を表示
  image(questionImage[resultPictureNum], (width-(960*0.8))/2, 0, 960*0.8, height*0.8);
  textSize(100);
  //回答の真偽を表示する
  if (judge[resultPictureNum]) {

    //fill(255, 0, 0);
    image(OkokImage, 0, 0,width,height);
    //text("正解!", 100, height-200);
  } else {
    //fill(0, 0, 255);
    image(NonoImage, 0, 0,width,height);
    //text("不正解!", 100, height-200);

  }
  //解説を表示する
  textSize(40);
  answerComment = takeAnswerComment(fileName[resultPictureNum]);
  fill(0);
  text(answerComment, 180, 600);
  //次へボタンや、戻るボタンを表示する
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
String takeAnswerComment(String fileName) {
  int id =  toFileNameInt(fileName);
  switch(levelOption) {
  case "easy":
    switch(id) {
    case 10317:
      return "1階、食堂前。エレベータがあるフロア";
    case 10319:
      return "1階、出入り口";
    case 10519:
      return "1階、一番東側のプレゼンテーションベイ";
    case 10919:
      return "1階、一番西側のプレゼンテーションベイ";
    case 11117:
      return "1階、西側の円卓";
    case 11119:
      return "1階、アトリエ前";
    case 11319:
      return "1階、アトリエ";
    case 11519:
      return "1階、アトリエ";
    case 30107:
      return "3階、正面玄関";
    case 30311:
      return "3階、ライブラリ横の通路。モール側";
    case 30707:
      return "3階、モールの真ん中にあるモニュメント。364前";
    case 30907:
      return "3階、イカボ。365、工房前";
    case 31103:
      return "3階、側面の体育館入り口";
    case 31107:
      return "3階、モール奥の階段にある植物";
    default:
      return "解説は設定されていません";
    }
  case "medium":
    switch(id) {
    default:
      return"解説は設定されていません";
    }
  case "hard":
    switch(id) {
    default:
      return"解説は設定されていません";
    }
  default:
    return "";
  }
}
