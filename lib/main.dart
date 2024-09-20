import 'package:flutter/material.dart';
import 'package:template/Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,

        // Define colors for your theme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 20, 20, 20),
          brightness: Brightness.dark,
        ),

        // Customize the text color globally
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),

        // Customize input decoration globally (for text fields)
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),

        // Customize button styles globally
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Button background color
            foregroundColor: Colors.black, // Button text color
          ),
        ),
      ),
    );
  }
}
