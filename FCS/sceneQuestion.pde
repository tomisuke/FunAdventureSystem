import java.io.File;
import java.util.ArrayList;

PImage[] questionImage;  //選ばれた画像を格納する配列
int MAX_SIZE;//問題数を指定する変数。Appタブで難易度により数値変更
String levelOption = "";
boolean displayFin = false;
boolean fileLoad=false;
boolean isLoading=false;
String[] imageFiles;
int nowImage = 0;
int interval = 1000;
int changeTime;
int loadingStartTime;
boolean showLoading = false;
String fileName[];

void drawLoadingAnimation() {
  if (!fun2Finished) {
    if (!fun2.isPlaying() && !fun2Started) {
      fun2.play();
      fun2Started = true;
    }
    if (fun2.isPlaying()) {
      image(fun2, 0, 0);
    } else {
      fun2Finished = true;
    }
  } else {
    image(fun2, 0, 0);
  }
}


void loadImage() {
  isLoading = true;
  displayFin = false;

  File folder = new File(dataPath(levelOption));
  imageFiles = folder.list((dir, name) -> name.toLowerCase().endsWith(".jpg"));

  if (imageFiles == null || imageFiles.length == 0) {
    println("フォルダに画像がないよう: " + levelOption);
    isLoading = false;
    return;
  }

  ArrayList<String> selectedFiles = new ArrayList<String>();
  for (String file : imageFiles) {
    String fileNamePrefix = fiveSelect(file);
    if (fileNamePrefix != null) {
      selectedFiles.add(fileNamePrefix + ".jpg");
    }
  }

  questionImage = new PImage[MAX_SIZE];
  for (int i = 0; i < MAX_SIZE; i++) {
    int randomIndex = int(random(selectedFiles.size()));//selectedFiles(arrayList)の要素数までのランダムな数字
    fileName[i] = selectedFiles.get(randomIndex);
    selectedFiles.remove(randomIndex);//選ばれたファイルをselectedFIles(arrayList)から削除

    questionImage[i] = loadImage(levelOption + "/" + fileName[i]);
    println("よみこみ: " + fileName[i]);
  }

  isLoading = false;
  changeTime = millis();
}

String fiveSelect(String fileName) {
  String match = fileName.replaceAll("^\\D*(\\d{5}).*", "$1");
  return match.length() == 5 ? match : null;
}


boolean gifStarted = false;
int gifStartTime = 0;
int gifDuration = 3000;

void drawQuestion() {
  background(255);
  if (soundFlag == true) {
    pictureChangeSE();
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
      pictureChangeSE();
      println("test2");
    }
  }

  if (nowImage < MAX_SIZE && questionImage[nowImage] != null) {
    image(questionImage[nowImage], (width-960)/2, 0, 960, height);
    if (nowImage==MAX_SIZE) {
      sceneChange=true;
    }
  }

  if (sceneChange==true) {
    frameRate(10);
    image(questionImage[MAX_SIZE], (width-960)/2, 0, 960, height);
    image(fun1, 0, 0);
    sceneChange=false;
    frameRate(60);
  }
}
