import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:national_id_extractor_app/extractor_screen.dart';
import 'package:national_id_extractor_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
    return MaterialApp(
      title: 'National ID Extractor',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const NationalIDExtractorScreen(),
    );
  }
}
