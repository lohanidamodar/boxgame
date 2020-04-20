import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

class BoxGame extends Game {
  Size screenSize;
  bool hasWon = false;
  double screenCenterX;
  double screenCenterY;
  @override
  void render(Canvas canvas) {
    Rect bgrect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint()..color = Color(0xff000000);
    canvas.drawRect(bgrect, bgPaint);
    Rect boxRect = Rect.fromLTWH(screenCenterX-75, screenCenterY-75, 150, 150);
    Paint boxPaint = Paint();
    if(hasWon) {
      boxPaint.color=Color(0xff00ff00);
    }else{
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  @override
  void resize(Size size) {
    screenSize = size;
    screenCenterX = screenSize.width/2;
    screenCenterY = screenSize.height/2;
    super.resize(size);
  }

  void onTapDown(TapDownDetails details ){
    if(details.globalPosition.dx >= screenCenterX-75
      && details.globalPosition.dx <= screenCenterX+75
      && details.globalPosition.dy >= screenCenterY-75
      && details.globalPosition.dy <= screenCenterY+75) {
        hasWon=true;
      }
  }

}