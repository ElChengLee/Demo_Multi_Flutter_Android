import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_item_view/main.dart';
import 'package:flutter_sample2/main.dart';

void main() {
  runApp(const MyApp());

  const platform = MethodChannel('com.example.open_widget');
  platform.setMethodCallHandler((call) {
    if (call.method == 'openWidget') {
      runApp(MyApp());
    }
  });
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({this.initialRoute = '/'});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/module1': (context) => const AppSample1(),
        '/module2': (context) => const AppSample2(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Gọi method từ ứng dụng Android native
            // Đặt route là '/widget' để mở WidgetToOpen
            // Nếu muốn mở widget khác, thay đổi route tương ứng
            // Dữ liệu route có thể được truyền từ Android native
          },
          child: Text('Open Widget'),
        ),
      ),
    );
  }
}
