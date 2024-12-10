/*かとうです。これはフィーリング判定タブ（仮）
 未完成。今はeasyIDを正解としている
 judgeAnswerはAppタブのjudge関数に存在。マップ(case==4)のjudgeボタンを押すと正解の文字がコンソールに
 */

void judgeAnswer() {//判定ボタンで正誤判定開始
  for (int id : answerId) {
    for (int i=0; i<MAX_SIZE; i++) {
      if (id==easyID[i]) {
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
