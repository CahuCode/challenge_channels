import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) {
      return false;
    }

    // Verificación real de internet (no solo WiFi / datos)
    try {
      final response = await InternetAddress.lookup('google.com');
      return response.isNotEmpty && response.first.rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }
}