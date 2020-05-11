# pip_view

Component to allow the presentation of a component below a floating one.

## Usage

``` dart
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PIPView(
      builder: (context, isFloating) {
        return Scaffold(
          body: Column(
            children: [
              Text('This is the screen that will float!');
              MaterialButton(
                child: Text('Start floating');
                onPressed: () {
                  PIPView.of(context).presentBelow(MyBackgroundScreen());
                },
              ),
            ],
          );
        );
      },
    );
  }
}

class MyBackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is my background page!');
    );
  }
}
```

