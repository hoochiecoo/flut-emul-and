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
      appBar: AppBar(
        title: const Text("Сегодня", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.account_circle, size: 30), onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: ActivityRings()),
            const SizedBox(height: 30),
            const Text("Статистика", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Row(children: [
                Expanded(child: StatCard(title: "Шаги", value: "8,432", icon: Icons.directions_walk, color: Colors.orange)),
                const SizedBox(width: 10),
                Expanded(child: StatCard(title: "Ккал", value: "450", icon: Icons.local_fire_department, color: Colors.red)),
            ]),
            const SizedBox(height: 30),
            const Text("Тренировки", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const WorkoutTile(title: "Бег", time: "08:30", duration: "45 мин", kcal: "320"),
            const WorkoutTile(title: "Силовая", time: "Вчера", duration: "60 мин", kcal: "410"),
          ],
        ),
      ),
    );
  }
}

class ActivityRings extends StatelessWidget {
  const ActivityRings({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, width: 200,
      child: Stack(alignment: Alignment.center, children: [
          CircularProgressIndicator(value: 0.7, strokeWidth: 15, color: Colors.red, backgroundColor: Colors.red.withOpacity(0.2)),
          SizedBox(width: 160, height: 160, child: CircularProgressIndicator(value: 0.5, strokeWidth: 15, color: Colors.green, backgroundColor: Colors.green.withOpacity(0.2))),
          const Icon(Icons.bolt, color: Colors.yellow, size: 40),
      ]),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title, value;
  final IconData icon;
  final Color color;
  const StatCard({super.key, required this.title, required this.value, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(title, style: const TextStyle(color: Colors.grey)),
      ]),
    );
  }
}

class WorkoutTile extends StatelessWidget {
  final String title, time, duration, kcal;
  const WorkoutTile({super.key, required this.title, required this.time, required this.duration, required this.kcal});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(12)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(time, style: const TextStyle(color: Colors.grey))]),
          Text("$duration | $kcal ккал", style: const TextStyle(color: Colors.white)),
      ]),
    );
  }
}
