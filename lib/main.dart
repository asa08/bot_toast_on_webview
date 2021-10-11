import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'BotToast Demo',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: WebView(), // please set WebView() or NormalView()
    );
  }
}

// MARK: NormalView
class NormalView extends StatefulWidget {
  NormalView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NormalView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _showAlert() {
    BotToast.showNotification(
      leading: (cancel) =>
          SizedBox.fromSize(
              size: const Size(40, 40),
              child: IconButton(
                icon: Icon(
                  Icons.add_alert,
                  color: Color(0xFF333333),
                ),
              )),
      title: (_) => Text('Notification'),
      subtitle: (_) => Text('Test\nTest\nTest'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Webview"),
        actions: [
          IconButton(
            onPressed: _showAlert,
            icon: Icon(Icons.add_alert),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// MARK: WebView
class WebView extends StatelessWidget {

  _showAlert() {
    BotToast.showNotification(
      leading: (cancel) => SizedBox.fromSize(
          size: const Size(40, 40),
          child: IconButton(
            icon: Icon(
              Icons.add_alert,
              color: Color(0xFF333333),
            ),
          )),
      title: (_) => Text('Notification'),
      subtitle: (_) => Text('Test\nTest\nTest'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
          url: "https://www.google.com",
          appBar: new AppBar(
            title: new Text("Webview"),
            actions: [
              IconButton(
                onPressed: _showAlert,
                icon: Icon(Icons.add_alert),
              )
            ],
          ),
        )
      },
    );
  }
}