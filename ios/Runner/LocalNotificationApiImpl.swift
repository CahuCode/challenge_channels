import UserNotifications

class LocalNotificationApiImpl: NSObject, LocalNotificationApi {
    func show(_ message: NotificationMessage) throws {
        let content = UNMutableNotificationContent()
        content.title = message.title ?? ""
        content.body = message.body ?? ""
        content.userInfo = ["payload": message.payload ?? ""]

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 1,
            repeats: false
        )

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
    
    protocol LocalNotificationApi {
      func show(message: NotificationMessage)
    }
}
