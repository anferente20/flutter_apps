import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';
import 'package:yes_no_app/presentaion/screens/chat/chat_screen.dart';
import 'package:yes_no_app/provider/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        title: 'Material App',
        home: const ChatScreen(),
      ),
    );
  }
}
