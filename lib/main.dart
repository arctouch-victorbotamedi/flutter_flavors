import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'app.dart';

void main() async {
  // This call is needed when we use an async main method
  WidgetsFlutterBinding.ensureInitialized();

  // Here we do the configuration based on our flavor.
  // This will change accordingly to your architecture of choice, we set
  // everything here just as a sample.
  var color = Colors.purple;
  var flavorName = "dev";
  var package = await PackageInfo.fromPlatform();
  switch (package.packageName)
  {
    case "com.example.flutter_flavors.dev":
      color = Colors.amber;
      break;
    case "com.example.flutter_flavors.qa":
      color = Colors.deepOrange;
      flavorName = "qa";
      break;
  }
  // We get the app name from the package since we configure it in the
  // platform itself
  var name = package.appName;
  runApp(MyApp(appName: name, color: color, flavorName: flavorName));
}
