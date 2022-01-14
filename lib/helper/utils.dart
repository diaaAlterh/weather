import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  /// here is functions frequently used
  String format(String format, DateTime dateTime) {
    try {
      return DateFormat(format).format(dateTime);
    }catch(e){
      return '';
    }
  }

  Future goToNextScreen(BuildContext context, Widget widget,
      {bool isReplacement = false}) async {
    if (isReplacement) {
      await Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (BuildContext context) {
        return widget;
      }));
    } else {
      await Navigator.of(context)
          .push(CupertinoPageRoute(builder: (BuildContext context) {
        return widget;
      }));
    }
  }
}

Utils utils = Utils();
