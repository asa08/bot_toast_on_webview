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
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2. registered route observer
      home: WebView(),
    );
  }
}

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