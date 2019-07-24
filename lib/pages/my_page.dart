import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyPageState();
  }
}

class _MyPageState extends State<MyScreen> {
  Widget _buildList() => ListView(
        children: <Widget>[
          _buildTitleSection(),
          Divider(),
           Divider(), 
          _buildCard(),
        ],
      );

  Widget _buildTitleSection() => Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image:
                        DecorationImage(image: AssetImage('assets/images/pic.jpg')))),
            Expanded(
              /*1*/
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*2*/
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '翎君',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Text(
                                '微信号：cxy1335668038',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 0.0, right: 0.0, bottom: 0.0),
                            child: Image(
                              image: AssetImage("assets/images/qr-code.png"),
                              width: 18,
                              height: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*3*/
          ],
        ),
      );

  Widget _buildCard() => SizedBox(
        child: Card(
          child: Column(
            children: [
              ListTile(
                title:
                    Text('支付', style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              Divider(),
              ListTile(
                title:
                    Text('收藏', style: TextStyle(fontWeight: FontWeight.w500)),
                leading: Icon(
                  Icons.collections_bookmark,
                  color: Colors.purple[300],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              ListTile(
                title: Text('相册'),
                leading: Icon(
                  Icons.picture_in_picture,
                  color: Colors.blue[400],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              ListTile(
                title: Text('卡包'),
                leading: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.blue[600],
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              ListTile(
                title: Text('表情'),
                leading: Icon(
                  Icons.face,
                  color: Colors.orange,
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              Divider(),
              Divider(),
              ListTile(
                title: Text('设置'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
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
        appBar: new AppBar(
          elevation: 0,
          actions:<Widget>[IconButton(icon: Icon(Icons.camera_alt,color:Colors.black),onPressed:null)],
        ),
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
        primaryColorBrightness:Brightness.light
      ),
    );
  }
}
