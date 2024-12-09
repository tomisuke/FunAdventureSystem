//ここはCtrlフィーリングP5ゾーン
void mapButton() {//setupに存在
  mapButton=new ControlP5(this);
  mapButton.setFont(font40);
  mapButton.addButton("delete")
    .setLabel("delete")
    .setPosition(1000, 600)
    .setSize(150, 150)
    .setColorCaptionLabel(TlabelColor)
    .setColorBackground(defaultButtonColor)
    .setColorLabel(TlabelColor)
    .setColorForeground(defaultForegroundColor)
    .setColorActive(defaultActiveColor);
}


/*かとうメモゾーン
 
 やったこと
 画面サイズにマップを合わせた
 マップscene4でのみ，マップの選択を有効にした
 選択したanswerIdをdeleteするボタンをつくった
 4階の事務局前のスペースが無かったのでマップ修正
 
 やること
 緑の四角の位置をどうにかする
 選択済みマスの座標を｛１，１，１｝で表示する


 配置や色などが終わっているので，調整する
 
 */
