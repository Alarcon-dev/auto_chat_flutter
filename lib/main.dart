import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_app/presentation/provider/chat_provider.dart";
import "package:yes_no_app/presentation/screens/chat/chat_screen.dart";
import "package:yes_no_app/theme/app_theme.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
        theme: AppTheme(colorSelector: 3).theme(),
      ),
    );
  }
}
