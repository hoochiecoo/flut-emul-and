import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Emulator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF121212),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Сегодня"), backgroundColor: Colors.transparent),
      body: const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Icon(Icons.fitness_center, size: 80, color: Colors.green),
                SizedBox(height: 20),
                Text("Fitness Emulator", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Build Success!", style: TextStyle(color: Colors.grey)),
            ]
        ),
      ),
    );
  }
}
