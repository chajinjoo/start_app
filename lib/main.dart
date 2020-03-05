import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // 이 앱의 루트 위젯입니다.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // 앱의 테마 데이터입니다.
        //
        // "flutter run" 명령어로 앱을 실행해 보세요.
        // 파란색 툴바를 가진 앱을 보실 수 있을겁니다.
        // 앱을 끄지 말고, primarySwatch 속성을 Colors.green으로 바꿔보세요.
        // "핫 리로드"를 경험하실 수 있습니다. "flutter run" 명령어로 실행한 경우 "r"키를 누르세요.
        // IntelliJ는 Run > Flutter Hot Reload를 선택하세요.
        // 카운터가 0으로 돌아가지 않는 것을 보실 수 있습니다.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 이 위젯은 앱의 첫 페이지입니다. 상태를 가집니다.
  // 이 말은, 상태(State) 아래에 정의된 객체를 가지고 있고 상태에 영향을 받는 것을 의미합니다.

  // 이 클래스는 상태 설정을 포함하고 있습니다.
  // title의 상태값을 가지고 있습니다.
  // 여기서 부모 위젯은 App 위젯으로부터 받은 값을 가지고 있습니다.
  // 서브클래스의 경우 항상 "final" 키워드를 붙여야 합니다.
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // setState 메소드는 플러터 프레임워크에서 어떤 상태를 변경하려는 경우에 사용합니다.
      // setState 메소드가 호출되면 아래의 build 메소드가 다시 실행되어 화면에 변경된 상태를 반영합니다.
      // setState 메소드를 호출하지 않고, _counter를 변경하면 build 메소드는 실행되지 않습니다.
      // 당연히 화면에는 아무런 변화가 없습니다.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 이 메소드는 매 setState 메소드 실행시에 호출됩니다.
    // 여기서는 "_incrementCounter" 메소드 때문에 실행됩니다.

    // 플러터 프레임워크는 build 메소드가 다시 호출되는 속도를 빠르게 하기 위한 최적화가 되어있습니다.
    // 위젯 인스턴스를 모두 변경하지 않고 갱신이 필요한 위젯만 다시 빌드합니다.
    return new Scaffold(
      appBar: new AppBar(
        // App.build 메소드가 만든 MyHomePage 객체에서 받은 값을 지정합니다.
        // 이는 앱 바의 타이틀에서 볼 수 있습니다.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Ceneter는 레이아웃 위젯입니다.
        // 한개의 자식 위젯을 가질 수 있고, 부모의 중앙에 위치합니다.
        child: new Column(
          // Column 또한 레이아웃 위젯입니다.
          // 여러개의 자식을 가질 수 있고 수직으로 정렬합니다.
          // 기본적으로 가로 크기는 자식의 크기에 맞추어 표시됩니다.
          // 세로 크기는 부모에 맞춰집니다.
          //
          // "debug paint"를 실행하면("flutter run" 명령어의 경우 "p"키, IntelliJ는 "Toggle Debug Paint")
          // 각 위젯의 와이어프레임을 볼 수 있습니다.
          //
          // Column은 다양한 크기와 위치를 지정할 수 있는 속성을 가지고 있습니다.
          // mainAxisAlignment는 center로 지정하여 자식들을 수직 중앙 정렬합니다.
          // 기준 축은 수직입니다.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // 끝에 있는 콤마는 build 메소드를 오토포맷팅을 하는데 도움을 줍니다.
    );
  }
}
