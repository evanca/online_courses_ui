import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_courses_ui/constants/theme.dart';
import 'package:online_courses_ui/ui/catalog_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.theme,
      home: const CatalogScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
