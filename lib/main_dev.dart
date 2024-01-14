import 'package:args/args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_environment/common/app_config.dart';
import 'package:flutter_environment/common/flavors.dart';
import 'package:flutter_environment/my_home_page.dart';

void main(List<String> arguments) {
  String someValue = const String.fromEnvironment("some_value");

  print("someValue $someValue");
  AppConfig appConfig =
      AppConfig("https://dev.exmaple.com", Flavor.free,
          someValue);
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
