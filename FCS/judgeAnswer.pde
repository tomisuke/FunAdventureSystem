void judgeAnswer() {//判定ボタンで正誤判定開始
  for (int id : answerId) {
    for (int i=0; i<MAX_SIZE; i++) {
      println(id, fileName[i]);
      if (id == toFileNameInt(fileName[i])) {
        judge[i]=true;//選択一つ一つに正解不正解を判定させるためのもの（正解はtrue）
        score++;
        println("正解");
      }
    }
  }
}

void judgeCancel() {//deleteに存在，判定を取り消す関数
  for (int i=0; i<MAX_SIZE; i++) {
    judge[i]=false;
  }
}

int toFileNameInt(String fileName) {
  String onlyID = fileName.replaceAll("[^0-9]", "");//String型のfileNameをIDのみに変換。ex)"12345.jpg"→12345
  return int(onlyID);
}
