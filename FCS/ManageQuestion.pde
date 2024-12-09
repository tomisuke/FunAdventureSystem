//写真(問題)を管理するクラス
class ManageQuestion {
  int id, level;
  int pictureLength = 1;
  PImage picture[];
  ManageQuestion(int id, int level) {
    this.id = id;
    this.level = level;
  }
  void setup() {
    picture = new PImage[pictureLength];
    for (int i = 0; i < picture.length; i++) {
      picture[i] = loadImage(str(id)+".png");
    }
    image(picture[0], 0, 0);
  }
}
