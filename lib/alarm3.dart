import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'main.dart';


void main() {
  runApp(CountDownTimers());
}


class CountDownTimers extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimers>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(hours: 2),//시간설정(이후 목표설정 창에서 시간 입력받음)
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,//첫 시작 배경색
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child:
                  Container(
                    color: Colors.white,//두번째 화면 배경색
                    height:
                    controller.value * MediaQuery.of(context).size.height,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                        animation: controller,
                                        backgroundColor: Colors.black12,//흘러가는 시간색
                                        color: themeData.indicatorColor,
                                      )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                          timerString,
                                          style: TextStyle(
                                              fontSize: 75.0,
                                              color: Colors.black54)//타이머 Text색,
                                      ),
                                      AnimatedBuilder(
                                          animation: controller,
                                          builder: (context, child) {
                                            return FloatingActionButton.extended(
                                                onPressed: () {
                                                  if (controller.isAnimating)
                                                    controller.stop();
                                                  else {
                                                    controller.reverse(
                                                        from: controller.value == 0.0
                                                            ? 1.0
                                                            : controller.value);
                                                  }
                                                },
                                                icon: Icon(controller.isAnimating
                                                    ? Icons.pause
                                                    : Icons.play_arrow),
                                                label: Text(
                                                    controller.isAnimating ? " " : " ")
                                              //어떻게 없앨수 있을까 고민중인데 다영아 너 여기 보여??이거 혹시 돌려보고 안되면 나한테 톡줘!!!!
                                              //여기 꼭봐진짜 제발 에러나면 이거때문인야 이게 그 시작 아이콘 옆에 글자넣는거야
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('홈'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('타이머')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('환경설정')
        )
      ],),
    );
  }
}