import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final valueInit = Provider<int>((ref) => 0);

final indexNavProvider = StateProvider<int>((ref) => 0);

final envProvider = StateProvider<String>((ref) => '');

/// CHANGE THEME APP
final isDarkThemeApp = StateProvider<bool>((ref) => false);

/// INFO DEVICE
/*final deviceInfoProvider = NotifierProvider<_DeviceInfoState, PackageInfo>(() => _DeviceInfoState());

class _DeviceInfoState extends Notifier<PackageInfo> {
  @override
  PackageInfo build() {
    return PackageInfo(appName: 'Unknown', packageName: 'Unknown', version: 'Unknown', buildNumber: 'Unknown');
  }

  void getInfodevice() async {
    try {
      state = await PackageInfo.fromPlatform();
    } on PlatformException {
      logDev.l('VERSION_APP >>> ERROR VERSION APP');
    }
  }
}*/
