import java.io.File;
import java.util.ArrayList;

PImage[] questionImage;
int MAX_SIZE;//問題数を指定する変数。Appタブで難易度により数値変更
String levelOption = "";
boolean displayFin = false;
boolean fileLoad=false;
boolean isLoading=false;
String[] imageFiles;
int nowImage = 0;
int interval = 500;
int changeTime;
int loadingStartTime;
boolean showLoading = false;

void drawLoadingAnimation() {
  background(255);
  fill(0);
  text("Now Loading", width / 2, height / 2 - 50);

  pushMatrix();
  popMatrix();
}

void loadImage() {
  isLoading=true;
  displayFin=false;

  File folder = new File(dataPath(levelOption));
  imageFiles = folder.list((dir, name) -> name.toLowerCase().endsWith(".jpg"));
  if (imageFiles == null || imageFiles.length == 0) {
    println("フォルダに画像がないよう: " + levelOption);
    isLoading = false;
    return;
  }

  ArrayList<String> selectedFiles = new ArrayList<String>();
  for (String file : imageFiles) {
    selectedFiles.add(file);
  }

  questionImage = new PImage[MAX_SIZE];
  for (int i = 0; i < MAX_SIZE; i++) {
    int randomIndex = int(random(selectedFiles.size()));
    String fileName = selectedFiles.get(randomIndex);
    selectedFiles.remove(randomIndex);

    questionImage[i] = loadImage(levelOption + "/" + fileName);
    println("よみこみ: " + fileName);
  }

  isLoading = false;
  changeTime=millis();
}

void drawQuestion() {
  if (soundFlag == true) {
    pictureChangeSound();
    println("test");
    soundFlag = false;
  }
  if (millis() - changeTime > interval) {
    nowImage++;
    changeTime = millis();

    if (nowImage >= MAX_SIZE) {
      nowImage = 0;
      displayFin = true;
    } else if (isLoading == false) {
      pictureChangeSound();
      println("test2");
    }
  }

  if (nowImage < MAX_SIZE && questionImage[nowImage] != null) {
    image(questionImage[nowImage], 0, 0, width, height);
  }
}
