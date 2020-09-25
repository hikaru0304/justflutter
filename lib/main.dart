import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '그-냥',
      theme: ThemeData(

        primarySwatch: Colors.indigo,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '오늘의 책'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index =0;
  var _pages=[
    Page1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 15.0,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _index=index;
          });
        },
        currentIndex: _index,
        items:<BottomNavigationBarItem> [
          BottomNavigationBarItem(
            title: Text('메인'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('타이머'),
            icon: Icon(Icons.timer),
          ),
        ],
      ),

    );
  }
}
class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        _buildTop0(),
        _buildTop(),
        _buildTop2(),
        _buildTop3(),
        _buildTop4(),
        _buildMiddle(),
        _buildMiddle2(),
        _buildMiddle3(),
        _buildMiddle4(),
        _buildBottom(),
      ],
    );
  }
}
//상단
Widget _buildTop0() {
  return Column(
    children: <Widget>[
      Image.asset('images/talk.png',
        width: 100,
        height: 100,),
    ],
  );
}
Widget _buildTop() {
  return Text(
    '당신의 지도는 아직 백지 인 것입니다',
    textAlign: TextAlign.center,
    style: new TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
Widget _buildTop2(){
  return Text(
    '...',
    textAlign: TextAlign.center,
    style: new TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
Widget _buildTop3(){
  return Text(
    '모든 것은 당신 하기 나름인 것이지요',
    textAlign: TextAlign.center,
    style: new TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
Widget _buildTop4(){
  return Text(
    '모든 것에서 자유롭고 가능성은 무한히 펼쳐져 있습니다.',
    textAlign: TextAlign.center,
    style: new TextStyle(
      color: Colors.black,
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
//중단
Widget _buildMiddle() {
  return Column(
    children: <Widget>[
      Image.asset('images/book.png',
        width: 256,
        height: 256,),
    ],
  );
}
Widget _buildMiddle2(){
  return Text(
    '나미야 잡화접의 기적',
    textAlign: TextAlign.center,
    style:TextStyle(fontSize: 13.0,
        fontWeight: FontWeight.bold
    ),
  );
}
Widget _buildMiddle3(){
  return Text(
    '히가시노 게이고',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
Widget _buildMiddle4(){
  return Text(
    '오늘의 책 사러 가기',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize:12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
Widget _buildBottom() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: RaisedButton(
      child: Text('다른 책 추천하기'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.grey,
      onPressed: () {},
    ),
  );
}
