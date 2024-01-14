import 'package:flutter/material.dart';
import 'package:flutter_environment/common/app_config.dart';
import 'package:flutter_environment/common/flavors.dart';
import 'package:flutter_environment/my_home_page.dart';

void main(List<String> arguments) {
  String someValue = String.fromEnvironment("some_value");

  AppConfig appConfig =
  AppConfig("https://example.com",
      Flavor.free,someValue);
  runApp(MyApp(appConfig));
}

class MyApp extends StatelessWidget {
  final AppConfig appConfig;

  MyApp(this.appConfig, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Environment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(appConfig: appConfig),
    );
  }
}
