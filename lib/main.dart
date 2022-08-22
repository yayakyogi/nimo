import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nimo/pages/homepage.dart';
import 'package:nimo/pages/setting.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then(
    (_) => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NIMO",
      theme: ThemeData(),
      home: Homepage(),
    );
  }
}
