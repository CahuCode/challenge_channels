import 'package:challenge_channels/pigeons/notification_api.g.dart';

class NotificationService {
  final NotificationApi _api = NotificationApi();

  Future<void> show({required String title, required String body, String? payload}) {
    return _api.showNotification(NotificationData(title: title, body: body, payload: payload));
  }
}
