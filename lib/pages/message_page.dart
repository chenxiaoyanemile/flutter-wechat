import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String _name = "Emily CH";

class ChatScreen extends StatefulWidget {
  final String todo;

  ChatScreen({Key key, @required this.todo}) : super(key: key);

  @override //new
  State createState() => new ChatScreenState(todo);
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  var title;

  ChatScreenState(String title) {
    this.title = title;
  }

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.volume_up),
            ),
            new Flexible(
              child: new TextField(
                cursorColor: Colors.white,
                controller: _textController,
                onChanged: (String text) {
                  //new
                  setState(() {
                    //new
                    _isComposing = text.length > 0; //new
                  }); //new
                }, //new
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new IconButton(
              icon: new Icon(Icons.tag_faces),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? //modified
                    new CupertinoButton(
                        //new
                        child: new Text("Send"), //new
                        onPressed: _isComposing //new
                            ? () => _handleSubmitted(_textController.text) //new
                            : null,
                      )
                    : //new
                    new IconButton(
                        //modified
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      //new
      _isComposing = false; //new
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        //new
        duration: new Duration(milliseconds: 700), //new
        vsync: this, //new
      ), //new
    ); //new
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Container(child: Text(title)),
                  flex: 5,
                ),
                Expanded(
                  child: Container(child: Icon(Icons.more_horiz)),
                  flex: 1,
                )
              ],
            ),
          ),
        ),
        body: Container(
            child: new Column(
              //modified
              children: <Widget>[
                //new
                new Flexible(
                  //new
                  child: new ListView.builder(
                    //new
                    padding: new EdgeInsets.all(8.0), //new
                    reverse: true, //new
                    itemBuilder: (_, int index) => _messages[index], //new
                    itemCount: _messages.length, //new
                  ), //new
                ), //new
                new Divider(height: 1.0), //new
                new Container(
                  //new
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor), //new
                  child: _buildTextComposer(), //modified
                ), //new
              ], //new
            ),
            decoration: Theme.of(context).platform == TargetPlatform.iOS //new
                ? new BoxDecoration(
                    //new
                    border: new Border(
                      //new
                      top: new BorderSide(color: Colors.grey[200]), //new
                    ), //new
                  ) //new
                : null), //new
      ),
      theme: new ThemeData(
          primaryColor: Colors.white, // 设置主题颜色
          primaryColorBrightness: Brightness.light),
    );
  }

  @override
  void dispose() {
    //new
    for (ChatMessage message in _messages) //new
      message.animationController.dispose(); //new
    super.dispose(); //new
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        //new
        sizeFactor: new CurvedAnimation(
            //new
            parent: animationController,
            curve: Curves.easeOut), //new
        axisAlignment: 0.0, //new
        child: new Container(
          //modified
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(_name[0])),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(_name, style: Theme.of(context).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ) //new
        );
  }
}

class Title {
  String title;
}
