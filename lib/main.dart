import 'package:flutter/material.dart';
import 'package:template/Pages/home_page.dart';
import 'package:template/Pages/new_todo.dart';
import 'package:template/models/save_task.dart';
import 'package:provider/provider.dart';
import 'package:template/models/API/todo_api.dart'; // Import the API

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  final networkService = NetworkService();
  String apiKey =
      await networkService.getApiKey(); 

  print(apiKey); 

  runApp(
    ChangeNotifierProvider(
      create: (context) => SaveTask(apiKey), 
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
        '/': (context) => HomePage(),
        '/new-todo-screen': (context) => NewTodo(),
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
