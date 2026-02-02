package com.cahu.code.challenge_channels

import android.content.Context

class NotificationApiImpl(
    private val context: Context
) : NotificationApi {

    private val helper = NotificationHelper(context)

    override fun showNotification(data: NotificationData) {
        helper.show(
            title = data.title ?: "",
            body = data.body ?: "",
            payload = data.payload
        )
    }
}
