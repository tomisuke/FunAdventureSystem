int[] easyID = {10317, 10319, 10519, 10919, 11117, 11119, 11319, 11519, 30107, 30311, 30707, 30907, 31107, 31113, 31307, 31309};
void setupQuestion() {
}
void sceneQuestion() {
}
String getPictureName(int level) {
  switch(level) {
  case 1:
    return str(easyID[int(random(easyID.length))])+".png";
  default:
    return "null";
  }
}
