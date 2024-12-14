void sceneAdventureSetup(){
    int buttonW = 200, buttonH = 100;
    modeAdventureButton = new ControlP5(this);
    modeAdventureButton.setFont(font40);
    modeAdventureButton.addButton("sc_sceneAdventure_picture")//写真を表示するシーンに遷移するためのボタン
    .setLabel("準備OK")
    .setPosition(width/2 - buttonW/2, height*3/4 - buttonH/2)
    .setSize(buttonW, buttonH)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);

    completeAdventureButton = new ControlP5(this);
    completeAdventureButton.setFont(font40);
    completeAdventureButton.addButton("sc_sceneQR")//写真を撮り終わったら、押してもらうボタン　qrコードを表示する
    .setLabel("探検完了")
    .setPosition(width - buttonW , height - buttonH)
    .setSize(buttonW, buttonH)
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
    text("写真が撮影できたら、右下に表示される探検完了ボタンを押してください",width/2,height/2);
    //準備OKボタンを押すと問題の写真が表示される
    //写真をとったら、ボタンを押してアップロードページに飛べるqrコードを表示
}
void sceneAdventure_picture(){//問題の写真を表示する
    background(255);
    image(questionImage[0], (width-960)/2, 0, 960, height);
    //探検完了ボタンも表示
}

void sceneQR (){//アップロードページに飛ぶqrコードを表示
    background(255);
    image(qr,width/2 - 225, height/2 - 225, 450,450);
    //一定間隔でサーバーにデータを送り続ける
    if(millis() - lastwritetime >= interval){
        println(levelOption + "/" + fileName[0]);
        client.write(levelOption + "/" + fileName[0]);
        println("write done");
        lastwritetime = millis();
    }
}
void clientEvent(Client client) {//サーバーから何か受け取ったときに発動する関数　
    String receiveS = client.readString();//serverから受け取る文字列

    //receiveSには、正解　もしくは　不正解　,nothingのどれかの文字列が入っている

    if(receiveS != null){
        println(receiveS);
    }

    reconnectToServer();
}
