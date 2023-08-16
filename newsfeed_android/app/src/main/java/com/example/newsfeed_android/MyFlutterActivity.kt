package com.example.newsfeed_android


import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

class MyFlutterActivity : FlutterActivity() {
	
	private val channel = "channel_flutter"
	override fun onResume() {
		super.onResume()
		flutterEngine?.dartExecutor?.binaryMessenger?.let {
			MethodChannel(it, channel)
				.invokeMethod("gotoPage", intent.getStringExtra("screen"))
		}
	}
	
	override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
		super.configureFlutterEngine(flutterEngine)
		MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel)
			.setMethodCallHandler { call, result ->
				when (call.method) {
					"exitFlutter" -> {
						finish()
					}
				}
			}
	}
	
	override fun provideFlutterEngine(context: Context): FlutterEngine? {
		return FlutterEngineCache.getInstance().get(FLUTTER_ENGINE_NAME12)
	}
}