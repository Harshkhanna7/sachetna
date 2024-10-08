package com.example.new_sachetna

import android.Manifest
import android.content.pm.PackageManager
import android.telephony.SmsManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.core.app.ActivityCompat

class MainActivity: FlutterActivity() {
    private val CHANNEL = "sendSms"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "send") {
                val phone = call.argument<String>("phone")
                val message = call.argument<String>("msg")
                sendSMS(phone, message, result)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun sendSMS(phone: String?, message: String?, result: MethodChannel.Result) {
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
            result.error("PERMISSION_DENIED", "SMS permission not granted", null)
            return
        }
        try {
            SmsManager.getDefault().sendTextMessage(phone, null, message, null, null)
            result.success("SMS sent")
        } catch (e: Exception) {
            result.error("ERROR", e.message, null)
        }
    }
}
