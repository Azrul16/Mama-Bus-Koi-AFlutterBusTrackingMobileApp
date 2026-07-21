package com.example.buskoi

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationCallback
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationResult
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.Priority

class BusLocationService : Service() {
    private lateinit var client: FusedLocationProviderClient
    private val callback = object : LocationCallback() {
        override fun onLocationResult(result: LocationResult) {
            val location = result.lastLocation ?: return
            LocationBridge.sink?.success(mapOf(
                "latitude" to location.latitude,
                "longitude" to location.longitude,
                "accuracy" to location.accuracy.toDouble(),
                "speed" to location.speed.toDouble(),
                "heading" to location.bearing.toDouble(),
                "timestamp" to location.time
            ))
        }
    }

    override fun onCreate() {
        super.onCreate()
        client = LocationServices.getFusedLocationProviderClient(this)
        createChannel()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == ACTION_STOP) {
            LocationBridge.sink?.error("SHARING_STOPPED", "User stopped sharing from the notification", null)
            stopSelf()
            return START_NOT_STICKY
        }
        val busName = intent?.getStringExtra("busName") ?: "bus"
        val stopIntent = Intent(this, BusLocationService::class.java).apply { action = ACTION_STOP }
        val stopAction = PendingIntent.getService(this, 2, stopIntent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        val notification = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            android.app.Notification.Builder(this, CHANNEL)
        } else {
            @Suppress("DEPRECATION") android.app.Notification.Builder(this)
        }.setSmallIcon(applicationInfo.icon)
            .setContentTitle("Mama Bus Koi")
            .setContentText("Sharing $busName's location")
            .setOngoing(true)
            .addAction(android.app.Notification.Action.Builder(null, "STOP SHARING", stopAction).build())
            .build()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_LOCATION) else startForeground(NOTIFICATION_ID, notification)
        startUpdates()
        return START_STICKY
    }

    private fun startUpdates() {
        val request = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 9000L).setMinUpdateIntervalMillis(8000L).build()
        try { client.requestLocationUpdates(request, callback, mainLooper) } catch (_: SecurityException) { stopSelf() }
    }

    override fun onDestroy() { client.removeLocationUpdates(callback); super.onDestroy() }
    override fun onBind(intent: Intent?): IBinder? = null
    private fun createChannel() { if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) getSystemService(NotificationManager::class.java).createNotificationChannel(NotificationChannel(CHANNEL, "Bus location sharing", NotificationManager.IMPORTANCE_LOW)) }
    companion object { private const val CHANNEL = "bus_location"; private const val NOTIFICATION_ID = 4201; private const val ACTION_STOP = "com.example.buskoi.STOP_LOCATION" }
}
