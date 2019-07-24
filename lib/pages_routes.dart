


import 'package:flutter/material.dart';
import 'index.dart';

class PageConstance {
  static String WELCOME_PAGE = '/';
  static String HOME_PAGE = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    var route = {
      HOME_PAGE: (BuildContext context) {
        return new Index();
      }
    };

    return route;
  }
}

