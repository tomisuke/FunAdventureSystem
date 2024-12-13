void sceneAdventure() {
    //探検モードの画面
    background(255);
    //text("次に表示される未来大の風景と同じような写真を撮影してください");
    //準備OKボタンを押すと問題の写真が表示される
    //写真をとったら、ボタンを押してアップロードページに飛べるqrコードを表示
}

void clientEvent(Client client) {//サーバーから何か受け取ったときに発動する関数
    String receiveS = client.readString();//serverから受け取る文字列
    //receiveSには、正解　もしくは　不正解　のどちらかの文字列が入っている
    
}