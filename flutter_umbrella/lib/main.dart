import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_item_view/main.dart';
import 'package:flutter_sample2/main.dart';

const channel = "channel_flutter";
const platformChannel = MethodChannel(channel);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({this.initialRoute = '/'});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        print("Binhnv13 - ${settings.name}");
        if (settings.name == "DetailPage") {
          return MaterialPageRoute(builder: (context) {
            return AppSample1();
          });
        } else {
          return MaterialPageRoute(
            builder: (context) {
              return AppSample2();
            },
          );
        }
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
