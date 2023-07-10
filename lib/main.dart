import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todoapp/Screens/todays_tasks_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

const kColoeScheme = Color.fromARGB(230, 57, 17, 73);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
          colorSchemeSeed: kColoeScheme,
          useMaterial3: true,
          fontFamily: GoogleFonts.merriweather().fontFamily,
          appBarTheme: const AppBarTheme(centerTitle: true)),
      home: const TodaysTasksScreen(),
    );
  }
}
