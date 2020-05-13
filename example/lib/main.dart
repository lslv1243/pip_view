import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PIPView(
      builder: (context, isFloating) {
        return Scaffold(
          resizeToAvoidBottomInset: !isFloating,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Text('This page will float!'),
                MaterialButton(
                  child: Text('Start floating!'),
                  onPressed: () {
                    PIPView.of(context).presentBelow(BackgroundScreen());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('This is the background page!'),
            Text('If you tap on the floating screen, it stops floating.'),
            Text('Navigation works as expected.'),
            MaterialButton(
              child: Text('Push to navigation'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => NavigatedScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigated Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('This is the page you navigated to.'),
            Text('See how it stays below the floating page?'),
            Text('Just amazing!'),
          ],
        ),
      ),
    );
  }
}
