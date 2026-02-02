import 'package:flutter/material.dart';

import '../logs/logdev.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logDev.l('OBSERVER  >> PUSH_ROUTE}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logDev.l('OBSERVER  >> POP_ROUTE');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logDev.l('OBSERVER  >> REMOVE_ROUTE');
  }
}
