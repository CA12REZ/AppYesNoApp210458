import 'package:flutter/material.dart';
import 'package:flutter_yesnoapp/config/theme/app_theme.dart';
import 'package:flutter_yesnoapp/presentation/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'YES NO APP',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 3).theme(),
        home: const ChatScreen());
  }
}
