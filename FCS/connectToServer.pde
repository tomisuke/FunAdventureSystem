void connectToServer() {//サーバーと接続する関数
    client = new Client(this, serverAddress, serverPort);
    println("Connected to server: " + serverAddress + "on port" + serverPort);
}

void reconnectToServer() {
    if (client != null) {
        client = null;//一度、サーバーとの接続を閉じる
        println("Disconnected from server.");
    }
    connectToServer();//サーバーと再接続する

}
