//ルール説明のシーン
void sceneRule(){
  textAlign(LEFT,TOP);
  int backRectW = 1500;
  int backRectH = 600;
  image(ruleImage,0,0,width,height);
  textSize(50);
  noStroke();
  fill(255,255,255,200);
  rect((width - backRectW)/2,(height - backRectH)/2, backRectW,backRectH);
  fill(0);
  text("a",0,0);
  println("SceneRule");
}
