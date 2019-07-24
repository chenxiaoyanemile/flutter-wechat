import 'package:flutter/material.dart';

import '../communicate_page.dart';

class FindScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FindPageState();
  }
}

class _FindPageState extends State<FindScreen> {
  Widget _buildList() => ListView(
        children: <Widget>[
          _buildCard(),
        ],
      );

  Widget _buildCard() => SizedBox(
        child: Card(
          child: Column(
            children: [
              ListTile(
                title:
                    Text('朋友圈', style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.camera,
                  color: Colors.pink[400],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                  onTap:(){
                    setState(() {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (BuildContext context) {
                            return new CommunicatePage();
                          }));
                    });
                  },
              ),
              Divider(),
              Divider(),
              ListTile(
                title:
                    Text('扫一扫', style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.compare_arrows,
                  color: Colors.blue[400],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              ListTile(
                title: Text('摇一摇'),
                leading: Icon(
                  Icons.phone_paused,
                  color: Colors.blue[600],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              Divider(),
              ListTile(
                title: Text('看一看'),
                leading: Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow[600],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              ListTile(
                title: Text('搜一搜'),
                leading: Icon(
                  Icons.flare,
                  color: Colors.orange,
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              Divider(),
              ListTile(
                title: Text('附近的人'),
                leading: Icon(
                  Icons.people,
                  color: Colors.blue,
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              ListTile(
                title: Text('购物'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red[400],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              ListTile(
                title: Text('游戏'),
                leading: Icon(
                  Icons.games,
                  color: Colors.orange[400],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: PreferredSize(
            child: new AppBar(
              elevation: 0.5,
              brightness: Brightness.light,
              backgroundColor: Colors.grey[100],
              title: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(child: Text('发现')),
                      flex: 5,
                    ),
                    Expanded(
                      child: Container(child: Icon(Icons.search)),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(child: Icon(Icons.add_circle_outline)),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(50.0)),
        body: new Center(
          child: new Container(
            //new
            decoration:
                new BoxDecoration(color: Theme.of(context).cardColor), //new
            child: _buildList(), //modified
          ),
        ),
      ),
      theme: new ThemeData(
          primaryColor: Colors.white, // 设置主题颜色
          primaryColorBrightness: Brightness.light),
    );
  }
}
