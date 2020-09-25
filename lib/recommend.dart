//다른책 추천하기
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '다른 책 추천하기',
      theme: ThemeData(

        primarySwatch: Colors.indigo,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '다른 책 추천하기'),
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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
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
        _buildbook(),
        _buildbook1(),
        _buildbook2(),
        _buildBottom(),
      ],
    );
  }
}
//상단
Widget _buildTop0() {
  return Column(
    children: <Widget>[
      Image.asset('images/book_02.png',
        width: 128,
        height: 128,),
    ],
  );
}
Widget _buildTop() {
  return Text(
    '좋은 책을 마음 껏 추천 해 주세요',
    textAlign: TextAlign.center,
    style: new TextStyle(
      color: Colors.black,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
Widget _buildTop2(){
  return Text(
    '추천해 주신 책의 정보가 그-냥의 홈 탭에 기재 됩니다.',
    textAlign: TextAlign.center,
    style: new TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
Widget _buildbook(){
  final maxLines = 5;

  return Container(
    margin: EdgeInsets.all(12),
    height: maxLines * 12.0,
    child: TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter a message",
        fillColor: Colors.grey[10],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: '책 제목',
      ),
    ),
  );
}
Widget _buildbook1(){
  final maxLines = 5;

  return Container(
    margin: EdgeInsets.all(12),
    height: maxLines * 12.0,
    child: TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter a message",
        fillColor: Colors.grey[10],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: '글쓴이',
      ),
    ),
  );
}
Widget _buildbook2(){
  final maxLines = 5;

  return Container(
    margin: EdgeInsets.all(12),
    height: maxLines * 30.0,
    child: TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        filled: true,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: '인상 깊은 구절',
      ),
    ),
  );
}
Widget _buildBottom(){
  return Align(
    alignment: Alignment.bottomCenter,
    child: RaisedButton(
      child: Text('제출하기'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.grey,
      onPressed: (){},
    ),
  );
}