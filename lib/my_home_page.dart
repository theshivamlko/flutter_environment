import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_environment/common/app_config.dart';

class MyHomePage extends StatefulWidget {
  AppConfig appConfig;

  MyHomePage({super.key, required this.appConfig});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PackageInfo? packageInfo;

  @override
  void initState() {
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) async {
      packageInfo = await PackageInfo.fromPlatform();
      print('Running on ${packageInfo!.packageName}'); // e.g. "Moto G (4)"
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Environment"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Configuration: \n'
                '${widget.appConfig.flavor}'
                '\n${widget.appConfig.baseUrl}'
                '\n${widget.appConfig.someValue}'
                '\n${kReleaseMode ? "Release Mode" : "Debug Mode"}',
                style: const TextStyle(fontSize: 25),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text(
                'Package name: \n'
                '${packageInfo?.packageName ?? ""}',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
