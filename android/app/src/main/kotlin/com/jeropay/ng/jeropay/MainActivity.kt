package com.jeropay.ng.jeropay

import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity : FlutterFragmentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        createNotificationChannels()
    }

    private fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val manager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager

            NotificationChannel(
                "jeropay_high_importance",
                "JeroPay Notifications",
                NotificationManager.IMPORTANCE_HIGH,
            ).apply {
                description = "Transaction alerts, wallet updates, and important JeroPay notifications"
                enableLights(true)
                enableVibration(true)
                setShowBadge(true)
            }.also { manager.createNotificationChannel(it) }
        }
    }
}
