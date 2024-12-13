void sceneAdventureSetup(){
    modeAdventureButton = new ControlP5(this);
    modeAdventureButton.setFont(font40);
    modeAdventureButton.addButton("sceneAdventure_picture")
    .setLabel("準備OK")
    .setPosition(width/2 + 150 , height/2 + 150)
    .setSize(150, 100)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
}
void sceneAdventure() {//探検モードの画面
    background(255);
    textAlign(CENTER,CENTER);
    text("次に表示される未来大の風景と\n同じような写真を撮影してください",width/2,height/4);
    text("準備ができたら、下のボタンを押して",width/2,height/2);
    //準備OKボタンを押すと問題の写真が表示される
    //写真をとったら、ボタンを押してアップロードページに飛べるqrコードを表示
}
void sceneAdventure_picture(){//問題の写真を表示する
    modeAdventureButton.hide();
    image(questionImage[0], (width-960)/2, 0, 960, height);
}

void clientEvent(Client client) {//サーバーから何か受け取ったときに発動する関数
    String receiveS = client.readString();//serverから受け取る文字列
    //receiveSには、正解　もしくは　不正解　のどちらかの文字列が入っている
    
}