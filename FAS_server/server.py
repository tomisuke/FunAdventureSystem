import threading
from flask import Flask, render_template, request, url_for, redirect
import socket
import os
import datetime
import glob
import cv2
from skimage.metrics import structural_similarity as ssim
import shutil
#サーバーを起動するpcとスマホが同じネットワーク内にいることを確認
#Flaskのサーバー
app = Flask(__name__, template_folder='templates')

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'GET':
        return render_template('upload.html')
    elif request.method == 'POST':
        file = request.files['example']
        file.save(os.path.join('FunAdventureSystem/FAS_server/FunImage', file.filename))
        return redirect(url_for('uploaded_file', filename=file.filename))

@app.route('/uploaded_file/<string:filename>')
def uploaded_file(filename):
    return render_template('uploaded_file.html', filename=filename)

def run_flask():    
    app.run(host = "0.0.0.0",port=8000, debug=False)

stop_event = threading.Event()

#Processingのサーバー
def run_socket():
    port = 5000
    BUFSIZE = 4096
    #SERVER = socket.gethostbyname(socket.gethostname())
    ADDR = ('127.0.0.1', port)
    FORMAT = 'utf-8'

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(ADDR)
    server.listen()

    try:
        while True:
            print(f'[New Connection] {ADDR} connected')
            client, addr = server.accept()

            msg = str(datetime.datetime.now())
            print(f'{msg}: 接続要求あり')
            print(client)

            data = client.recv(BUFSIZE)#クライアント(processing)から貰うデータ
            print(data.decode(FORMAT))

            pic1 = "FunAdventureSystem/FAS_server/FunImage1/" + data.decode(FORMAT)
            files = glob.glob("./FunAdventureSystem/FAS_server/FunImage/*.jpeg")#funimage下のjpegファイルを探して、pic2に入れる
            
            pic2 = None  # 初期化
            for file in files:
                pic2 = file
            print(f"Selected pic2: {pic2}")

            # pic2が空の場合は処理をスキップする
            if not pic2:
                print("No valid file found for comparison, skipping...")
                client.sendall("nothing".encode(FORMAT))
                client.close()
                continue

            # pic2が空でない場合のみ実行する
            image1 = cv2.imread(pic2, cv2.IMREAD_GRAYSCALE)#image1には、プレイヤーがとった写真が入る
            image2 = cv2.imread(pic1, cv2.IMREAD_GRAYSCALE)#image2には、processingから送られてきた文字列の名前の画像が入る
            
            if image1.shape != image2.shape:
                image1 = cv2.resize(image1,(image2.shape[1],image2.shape[0]))#大きさが違うときは、image1側をリサイズ
            score, diff = ssim(image1, image2, full=True)
            print(f"SSIM Score: {score}")
            #ssimが0.5以上で正解にする
            if score >= 0.5:
                client.sendall("正解".encode(FORMAT))
            else:
                client.sendall("不正解".encode(FORMAT))
            #funimageファイルの中身を空にする
            shutil.rmtree('FunAdventureSystem/FAS_server/FunImage')
            os.mkdir('FunAdventureSystem/FAS_server/FunImage')
            client.close()

    except KeyboardInterrupt:
        print('Processing server stopped')
    finally:
        server.close()


# 両方のサーバーをスレッドで起動
if __name__ == "__main__":
    socket_thread = threading.Thread(target=run_socket,daemon=True)
    flask_thread = threading.Thread(target=run_flask,daemon=True)

    socket_thread.start()
    flask_thread.start()

    try:
        while True:
            pass
    except KeyboardInterrupt:
        print('Shut dawn server')
        stop_event.set()
        socket_thread.join()
        flask_thread.join()
    
    