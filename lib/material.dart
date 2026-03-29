import 'package:flutter/material.dart';
import 'package:journal_app/screens/JournalHomeScreen.dart';

class MyJournalApp extends StatelessWidget {
  const MyJournalApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Journal App",
      debugShowCheckedModeBanner: false,
      home: JournalhomeScreen(),
    );
  }
}
