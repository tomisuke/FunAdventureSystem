int startCount = 0;
int countDown = 4;
void sceneCountDown() {
  image(mapBGImage, 0, 0, width, height);  //画像を表示
  if (millis()-startCount >= 1000) {
    countDown--;
    startCount = millis();
    countDownSE();
  }
  textSize(100);
  text(countDown,width/2,height/2);
  if (countDown == 0) {
    countDown = 4;
    scene = 3;
  }
}
