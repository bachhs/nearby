import 'package:flutter/material.dart';
import 'package:nearby/screens/home/home_screen.dart';
import 'package:nearby/services/notification_service.dart';
import 'package:wemapgl/wemapgl.dart' as WEMAP;

Future<void> main() async {
  WEMAP.Configuration.setWeMapKey('GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ');
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nearby Location',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
