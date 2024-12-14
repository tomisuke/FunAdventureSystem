void connectToServer() {//サーバーと接続する関数
    client = new Client(this, serverAddress, serverPort);
    println("Connected to server: " + serverAddress + "on port" + serverPort);
}

<<<<<<< HEAD
void reconnectToServer() {//サーバーと再接続する関数
=======
void reconnectToServer() {
>>>>>>> 1e5f49a549ef480126291daf66428e8404b3d4d0
    if (client != null) {
        client = null;//一度、サーバーとの接続を閉じる
        println("Disconnected from server.");
    }
    connectToServer();//サーバーと再接続する
<<<<<<< HEAD

=======
>>>>>>> 1e5f49a549ef480126291daf66428e8404b3d4d0
}
