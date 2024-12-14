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
    image(OkokImage, 0, 0, width, height);
    //text("正解!", 100, height-200);
  } else {
    //fill(0, 0, 255);
    image(NonoImage, 0, 0, width, height);
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
    case 31113:
      return "3階、イカボ";
    case 31307:
      return "3階、体育館前";
    case 10115:
      return "2階、食堂";
    default:
      return "解説が設定されていない写真";
    }
  case "middle":
    switch(id) {
    case 10313:
      return "1階、食堂近くの自販機";
    case 10715:
      return "1階、角康之研究室";
    case 11317:
      return "1階、アトリエ前の研究室";
    case 30105:
      return "3階、ミュージアム前";
    case 30503:
      return "3階、裏口に繋がる通路";
    case 30509:
      return "3階、エレクトロニクス工房にある電源が切れたペッパー君";
    case 30905:
      return "3階、工房のゴミ箱";
    case 30913:
      return "3階、西側の円卓";
    case 31109:
      return "3階、心理学実験室";
    case 31507:
      return "3階、体育館前の非常口に置いてあるフクロウの置物";
    case 31509:
      return "3階、大講義室(研究棟側)";
    case 50309:
      return "5階、東側の円卓";
    case 50317:
      return "5階、エレベーター前の通路";
    case 51105:
      return "5階、サークル室近くのゴミ箱";
    default:
      return"解説が設定されていない写真";
    }
  case "hard":
    switch(id) {
    case 10713:
      return "調査中";
    case 10719:
      return "1階、真ん中のプレゼンテーションベイ(RGBのG)";
    case 11115:
      return "1階、西側トイレ";
    case 11517:
      return "1階、アトリエ前の研究室";
    case 30507:
      return "3階、モールのエレベータ";
    case 30513:
      return "3階、じゃみ研究室";
    case 30711:
      return "3階、美馬のゆり研究室";
    case 30909:
      return "3階、365教室";
    case 40311:
      return "4階、手前のモールの階段横の案内表示";
    case 50109:
      return "5階、コネカフェ近くn会議室";
    case 50113:
      return "5階、講堂裏の通路";
    default:
      return"解説が設定されていない写真";
    }
  default:
    return "この難易度に解説はない";
  }
}
