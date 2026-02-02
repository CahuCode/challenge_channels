import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/pigeons/notification_api.g.dart',
    dartOptions: DartOptions(),
/*    cppOptions: CppOptions(namespace: 'pigeon_example'),
    cppHeaderOut: 'windows/runner/messages.g.h',
    cppSourceOut: 'windows/runner/messages.g.cpp',
    gobjectHeaderOut: 'linux/messages.g.h',
    gobjectSourceOut: 'linux/messages.g.cc',
    gobjectOptions: GObjectOptions(),*/
    kotlinOut:
    'android/app/src/main/kotlin/com/cahu/code/challenge_channels/pigeons/NotificationApi.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.cahu.code.challenge_channels'),
    //javaOut: 'android/app/src/main/java/io/flutter/plugins/Messages.java',
    //javaOptions: JavaOptions(),
    swiftOut: 'ios/Runner/NotificationApi.g.swift',
    swiftOptions: SwiftOptions(),
    //objcHeaderOut: 'macos/Runner/messages.g.h',
    //objcSourceOut: 'macos/Runner/messages.g.m',
    // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
    //objcOptions: ObjcOptions(prefix: 'PGN'),
    //copyrightHeader: 'pigeons/copyright.txt',
    dartPackageName: 'pigeon_notification_package',
  ),
)

// dart run pigeon --input pigeons/notification_api.dart

class NotificationMessage {
  String? title;
  String? body;
  String? payload;
}

@HostApi()
abstract class LocalNotificationApi {
  void show(NotificationMessage message);
}