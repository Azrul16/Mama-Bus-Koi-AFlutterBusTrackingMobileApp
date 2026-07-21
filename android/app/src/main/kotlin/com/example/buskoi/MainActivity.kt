package com.example.buskoi

import android.content.Intent
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "mama_bus_koi/location").setMethodCallHandler { call, result ->
            when (call.method) {
                "start" -> {
                    val intent = Intent(this, BusLocationService::class.java).apply {
                        putExtra("busName", call.argument<String>("busName") ?: "Bus")
                    }
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) startForegroundService(intent) else startService(intent)
                    result.success(null)
                }
                "stop" -> { stopService(Intent(this, BusLocationService::class.java)); result.success(null) }
                else -> result.notImplemented()
            }
        }
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "mama_bus_koi/location_stream").setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, sink: EventChannel.EventSink?) { LocationBridge.sink = sink }
            override fun onCancel(arguments: Any?) { LocationBridge.sink = null }
        })
    }
}

object LocationBridge {
    @Volatile var sink: EventChannel.EventSink? = null
}
