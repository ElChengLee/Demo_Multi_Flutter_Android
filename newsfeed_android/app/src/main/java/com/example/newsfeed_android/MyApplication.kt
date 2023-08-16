package com.example.newsfeed_android

import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor


const val FLUTTER_ENGINE_NAME12 = "nps_flutter_engine_name1"
class MyApplication : FlutterApplication() {
	
	private lateinit var flutterEngine: FlutterEngine
	
	override fun onCreate() {
		super.onCreate()
		flutterEngine = FlutterEngine(this)
		
		// Configure an initial route.
		flutterEngine.navigationChannel.setInitialRoute("/DetailPage");
		// Start executing Dart code to pre-warm the FlutterEngine.
		flutterEngine.dartExecutor.executeDartEntrypoint(
			DartExecutor.DartEntrypoint.createDefault()
		)
		
		// Cache the FlutterEngine to be used by FlutterActivity.
		FlutterEngineCache
			.getInstance()
			.put(FLUTTER_ENGINE_NAME12, flutterEngine)
	}
}