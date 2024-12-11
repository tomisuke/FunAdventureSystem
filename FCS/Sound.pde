void titleSound() {
  bgm = minim.loadFile("sound/projectX.mp3");
  bgm.play();
}
void backSound() {
  se = minim.loadFile("sound/キャンセル.mp3");
  se.play();
}
void pictureChangeSound() {
  se = minim.loadFile("sound/changePicture.mp3");
  se.play();
}
void pushSound() {
  se = minim.loadFile("sound/爆発.mp3");
  se.play();
}
