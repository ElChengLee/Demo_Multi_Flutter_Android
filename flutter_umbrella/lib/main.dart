import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_item_view/main.dart' as lib1;
import 'package:flutter_sample2/main.dart' as lib2;

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
        routes: <String, WidgetBuilder>{
          ...lib1.Library1Routes.routes,
          ...lib2.Library1Routes.routes,
        },
        onUnknownRoute: (RouteSettings setting) {
          return MaterialPageRoute(builder: (context) => SplashScreen());
        });
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
          child: Text('SplashScreen 1'),
        ),
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
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
          child: Text('SplashScreen 2'),
        ),
      ),
    );
  }
}
