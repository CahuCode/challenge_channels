import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

class logDev {
  static final SimpleLogger _logDev =
  SimpleLogger()
    ..mode = LoggerMode.log
    ..setLevel(Level.CONFIG, includeCallerInfo: true);

  static final _showLog = true;

  // IMPORTANT LOW - HIGT
  static void fff(String msg) {
    if (_showLog) _logDev.finest(msg);
  }

  static void ff(String msg) {
    if (_showLog) _logDev.finer(msg);
  }

  static void f(String msg) {
    if (_showLog) _logDev.fine(msg);
  }

  static void c(String msg) {
    if (_showLog) _logDev.config(msg);
  }

  static void i(String msg) {
    if (_showLog) _logDev.info(msg);
  }

  static void w(String msg) {
    if (_showLog) _logDev.warning(msg);
  }

  static void e(String msg) {
    if (_showLog) _logDev.shout(msg);
  }

  static void s(String msg) {
    if (_showLog) _logDev.severe(msg);
  }

  static void l(String msg) {
    if (_showLog) log(msg);
  }

  static void d(String msg) {
    if (_showLog) debugPrint(msg);
  }
}
