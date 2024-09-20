import 'package:flutter/material.dart';
import 'package:template/Pages/home_page.dart';
import 'package:template/Pages/new_todo.dart';
import 'package:template/models/save_task.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SaveTask(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => HomePage(),
        '/new-todo-screen': (_) => NewTodo(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 20, 20, 20),
          brightness: Brightness.dark,
        ),
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
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
