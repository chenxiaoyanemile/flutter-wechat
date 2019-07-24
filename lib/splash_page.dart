import 'package:flutter/material.dart';
import 'package:flutter_demo/pages_routes.dart';
import 'package:flutter_demo/skip_down_time.dart';

class SplashPage extends StatefulWidget{

  SplashPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> implements OnSkipClickListener{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delayedGoHomePage();
  }

  _delayedGoHomePage() {
    Future.delayed(new Duration(seconds: 5), () {
      _goHomePage();
    });
  }

  _goHomePage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        PageConstance.HOME_PAGE, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new Image.asset('assets/images/bol.jpg',fit: BoxFit.cover),
          constraints: new BoxConstraints.expand(),
        ),
        new Container(
          child: Align(
            alignment: Alignment.topRight,
            child: new Container(
              padding: const EdgeInsets.only(top: 30.0, right: 20.0),
              child: new SkipDownTimeProgress(
                Colors.red,
                22.0,
                new Duration(seconds: 5),
                new Size(25.0, 25.0),
                skipText: "跳过",
                clickListener: this,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onSkipClick() {
    _goHomePage();
  }
}