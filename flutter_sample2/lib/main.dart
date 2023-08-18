import 'package:flutter/material.dart';

void main() => runApp(const AppSample2());

class AppSample2 extends StatelessWidget {
  const AppSample2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      routes: Library1Routes.routes,
      initialRoute: Library1Routes.route1,
    );
  }
}

class Library1Routes {
  static const String route1 = 'AppSample2route1';
  static const String route2 = 'AppSample2route2';

  static final routes = <String, WidgetBuilder>{
    route1: (context) => const MyHomePage(),
    route2: (context) => const MyHomePage2(),
  };
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = ""});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'MyHomePage 2 Router 1',
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Library1Routes.route2);
                },
                child: const Text('Go to Screen 2'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key, this.title = ""});

  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'MyHomePage 2 Router 2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
