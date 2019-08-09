import 'package:flutter/material.dart';

class CommunicatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CommunicatePageState();
  }
}

class _CommunicatePageState extends State<CommunicatePage> {
  Widget _buildList() => ListView(
        children: <Widget>[
          _buildTop(),
          _buildAuthor(),
          // 文字
          _buildText(),
          //图片
          _buildPicture(),
          //喜欢、评论、分享
          _buildLike(),
        ],
      );

  Widget _buildTop() => Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          new Container(
            child:
                new Image.asset('assets/images/im-01.jpg', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
                Container(
                    child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                )),
              ],
            ),
          ),
          new Positioned(
            right: 10,
            bottom: -15,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    child: new Text("Emily CH", textAlign: TextAlign.center)),
                new Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                  child: new Image.asset("assets/images/pic.jpg"),
                ),
              ],
            ),
          ),
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
                    image: DecorationImage(
                        image: AssetImage('assets/images/material-1.png')))),
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

  Widget _buildAuthor() => Row(
        children: [
          new Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: new Stack(
                alignment: const FractionalOffset(0, 0.8),
                children: [
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pic.jpg'),
                      radius: 20,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                    ),
                    child: Text(
                      'Emily CH',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Icon(
            Icons.more_vert,
            color: Colors.black45,
          ),
        ],
      );

  Widget _buildPicture() => new Image.asset(
        'assets/images/p.jpg',
        width: 300.0,
        height: 240.0,
        fit: BoxFit.fitWidth,
      );

  Column buildButtonColumn(IconData icon) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
      ],
    );
  }

  Widget _buildLike() => new Container(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButtonColumn(Icons.favorite_border),
              buildButtonColumn(Icons.comment),
              buildButtonColumn(Icons.share),
            ],
          ),
        ),
      );

  Widget _buildText() => new Container(
        padding: const EdgeInsets.all(4.0),
        child: new Text(
          '''今天星期五啦，卷饼配意粉，再加一点西红柿，美好的一天!''',
          softWrap: true,
        ),
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        body: _buildList(),
      ),
    );
  }
}
