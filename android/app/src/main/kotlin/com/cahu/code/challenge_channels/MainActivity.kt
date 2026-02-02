package com.cahu.code.challenge_channels

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        NotificationApi.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            NotificationApiImpl(this)
        )
    }
}
