import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/models/friend_model.dart';
import 'package:flutter_demo/pages/message_page.dart';
import 'package:flutter_demo/widgets/az_common.dart';
import 'package:flutter_demo/widgets/az_listview.dart';
import 'package:lpinyin/lpinyin.dart';

class FriendScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IdeaPageState();
}

class _IdeaPageState extends State<FriendScreen> {
  List<ContactInfo> _cityList = List();
  List<ContactInfo> _hotCityList = List();

  int _suspensionHeight = 60;
  int _itemHeight = 70;
  String _suspensionTag = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget _buildList() => ListView(
        children: [
          AzListView(
            data: _cityList,
            topData: _hotCityList,
            itemBuilder: (context, model) => _buildListItem(model),
            suspensionWidget: _buildSusWidget(_suspensionTag),
            isUseRealIndex: true,
            itemHeight: _itemHeight,
            suspensionHeight: _suspensionHeight,
            onSusTagChanged: _onSusTagChanged,
            //showCenterTip: false,
          ),
        ],
      );

  ListTile _tile(String title, String assetName) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
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

  void loadData() async {
    _hotCityList.add(ContactInfo(name: "新的朋友", path:'assets/images/new-friend.png',tagIndex: "↑"));
    _hotCityList.add(ContactInfo(name: "群聊", path:'assets/images/chat.png',tagIndex: "↑"));
    _hotCityList.add(ContactInfo(name: "标签", path:'assets/images/flag.png',tagIndex: "↑"));
    _hotCityList.add(ContactInfo(name: "公众号", path:'assets/images/describe.png',tagIndex: "↑"));

    //加载城市列表
    rootBundle.loadString('assets/data/china.json').then((value) {
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      list.forEach((value) {
        _cityList.add(ContactInfo(name: value['name'],path: value['path']));
      });
      setState(() {
        _suspensionTag = _hotCityList[0].getSuspensionTag();
      });
      _handleList(_cityList);
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(_cityList);
  }

  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = tag;
    });
  }

  bool visible = false;
  Widget _buildSusWidget(String susTag) {
    susTag = (susTag == "★" ? "星标朋友" : susTag);
    if(susTag == "↑"){
      visible = true;
    }else{
      visible = false;
    }
    return Container(
      height: 20,
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Offstage(
        offstage: visible,
        child: Text(
          '$susTag',
          softWrap: false,
          style: TextStyle(
            fontSize: 12.0,
            color: Color(0xff999999),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    susTag = (susTag == "★" ? "星标朋友" : susTag);
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
          height: _itemHeight.toDouble(),
          child: ListTile(
            title: Text(model.name),
            leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: ExactAssetImage(model.path)))),
            onTap: () {
              setState(() {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                      return new ChatScreen(todo: model.name);
                    }));
              });
            },

          ),
        )
      ],
    );
  }

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
                      child: Container(child: Text('通讯录')),
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
        body: AzListView(
          data: _cityList,
          topData: _hotCityList,
          itemBuilder: (context, model) => _buildListItem(model),
          suspensionWidget: _buildSusWidget(_suspensionTag),
          isUseRealIndex: true,
          itemHeight: _itemHeight,
          suspensionHeight: _suspensionHeight,
          onSusTagChanged: _onSusTagChanged,
          //showCenterTip: false,
        ),
      ),
      theme: new ThemeData(
          primaryColor: Colors.white, // 设置主题颜色
          primaryColorBrightness: Brightness.light),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
