import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
      UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert, .sound, .badge]
      ) { granted, error in
        print("Permission granted: \(granted)")
      }
      
    let controller = window?.rootViewController as! FlutterViewController

    LocalNotificationApiSetup(
        binaryMessenger: controller.binaryMessenger,
        api: LocalNotificationApiImpl()
    )
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
