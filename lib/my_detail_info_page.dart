import 'package:flutter/material.dart';

//个人信息

class MyDetailInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyDetailInfoScreenState();
  }
}

class _MyDetailInfoScreenState extends State<MyDetailInfoScreen> {


  Widget _buildCard() => SizedBox(
    child: Card(
      child: Column(
        children: [
          ListTile(
            leading:
            Text('头像', style: TextStyle(fontWeight: FontWeight.w500)),
            title: new Image.asset('assets/images/pic.jpg'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            leading:
            Text('昵称', style: TextStyle(fontWeight: FontWeight.w500)),
            title: Text(
              '翎君'
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            leading: Text('微信号'),
            title: Text(
              'cxy1335668038'
            ),
          ),
          Divider(),
          ListTile(
            leading: Text('微信二维码'),
            title: Image.asset(
             'assets/images/qr-code.png'
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            leading: Text('更多'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          Divider(),
          ListTile(
            leading: Text('我的地址'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            leading: Text('我的发票抬头'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          elevation: 0.2,
          brightness: Brightness.light,
          backgroundColor: Colors.grey[100],
          title: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(child: Icon(Icons.arrow_back_ios)),
                  flex: 1,
                ),
                Expanded(
                  child: Container(child: Text("个人信息")),
                  flex: 5,
                )
              ],
            ),
          ),
        ),
        body: new Center(
            child: _buildCard(),
        ),
      ),
      theme: new ThemeData(
          primaryColor: Colors.white, // 设置主题颜色
          primaryColorBrightness: Brightness.light
      ),
    );
  }
}
