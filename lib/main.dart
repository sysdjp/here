import 'package:bottomnavigatortest/page_update.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) =>  MyApp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/update': (context) => Page_Update(),
    },
  ),
);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyApp> {
  var _navIndex = 0;
  var _label = '';
  var _titles = ['設定', '検索', '更新'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('情報'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('設定'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            title: Text('投稿'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            title: Text('検索結果'),
          ),
        ],
        onTap: (int index) {
          setState(
                () {
              _navIndex = index;
              _label = _titles[index];
              Navigator.pushNamed(context, '/update');
            },
          );
        },
        currentIndex: _navIndex,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                _label,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}