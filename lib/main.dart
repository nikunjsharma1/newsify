import 'package:flutter/material.dart';
import 'package:newsify/theme/themedata.dart';
import 'package:newsify/views/splashScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: NewsifyMaterialApp(),
    );
  }
}


class NewsifyMaterialApp extends StatelessWidget {
  const NewsifyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        title: 'Newsify',
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}


