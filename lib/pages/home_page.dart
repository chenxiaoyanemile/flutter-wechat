import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/message_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomeScreen> {
  Widget _buildList() => ListView(
        children: [
          _tile('Carina', '嗯嗯😊', '早上 10：51', "assets/images/im-03.jpg"),
          Divider(),
          _tile('Aaron', "Good night Emily, keep in touch ok!", '7月22日',
              "assets/images/im-04.jpg"),
          Divider(),
          _tile('Deniz', '楼下有喜士多，你可以在那。。。', '7月21日', "assets/images/im-05.jpg"),
          Divider(),
          _tile('Robby', '[转账]朋友已确认收款', '6月21日', "assets/images/im-01.jpg"),
          Divider(),
          _tile('Emily', '那就不用啦', '6月28日', "assets/images/pic.jpg"),
          Divider(),
          _tile('La Ciccia', '好的', '7月20日', "assets/images/im-02.jpg"),
        ],
      );

  ListTile _tile(String title, String message, String date, String assetName) =>
      ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(message,softWrap:false,overflow: TextOverflow.ellipsis),
        trailing: Text(date),
        leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(assetName)))),
        onTap: () {
          setState(() {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
              return new ChatScreen(todo: title);
            }));
          });
        },
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
                      child: Container(child: Text('微信')),
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
          child: _buildList(),
        ),
      ),
      theme: new ThemeData(
          primaryColor: Colors.white, // 设置主题颜色
          primaryColorBrightness: Brightness.light),
    );
  }
}
