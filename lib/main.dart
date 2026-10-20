import 'package:flutter/material.dart';

void main() {
  runApp(const DJSmartDocApp());
}

class DJSmartDocApp extends StatelessWidget {
  const DJSmartDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DJ Smart Doc',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF3B82F6), // Professional Blue
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Deep Slate Background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E293B),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // "DJ" නම සහිත Custom Logo එකක් (Avatar)
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: const Text(
                'DJ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Smart Doc',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
            onPressed: () {
              // ඩොකියුමන්ට් සෙවීමේ පහසුකම
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent University Documents',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  DocCard(
                    title: 'Algorithms & Data Structures.pdf',
                    subtitle: 'PDF • 4.2 MB • Page 45',
                    iconColor: Colors.redAccent,
                  ),
                  DocCard(
                    title: 'Software Engineering Lecture 01.ppt',
                    subtitle: 'PowerPoint • 12.8 MB',
                    iconColor: Colors.orangeAccent,
                  ),
                  DocCard(
                    title: 'Database Management Systems.pdf',
                    subtitle: 'PDF • 8.5 MB • Page 12',
                    iconColor: Colors.redAccent,
                  ),
                  DocCard(
                    title: 'Operating Systems Notes.epub',
                    subtitle: 'E-Book • 2.1 MB',
                    iconColor: Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // දුරකථන මතකයෙන් ෆයිල් තෝරාගැනීමට
        },
        backgroundColor: const Color(0xFF3B82F6),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Open Document',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DocCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconColor;

  const DocCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E293B),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.insert_drive_file, color: iconColor, size: 34),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFF64748B)),
        onTap: () {
          // ඩොකියුමන්ට් එක විවෘත වන තැන
        },
      ),
    );
  }
}
