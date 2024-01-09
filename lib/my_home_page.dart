import 'package:flutter/material.dart';
import 'package:flutter_environment/common/app_config.dart';

class MyHomePage extends StatefulWidget {
  AppConfig appConfig;

  MyHomePage({super.key, required this.appConfig});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Environment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Environment',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              '${widget.appConfig.flavor}'
                  '\n${widget.appConfig.baseUrl}'
                  '\n${widget.appConfig.someValue}',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
