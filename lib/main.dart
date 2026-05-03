import 'package:flutter/material.dart';
import 'exercise1.dart';
import 'exercise2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'كوفي شوب - معمل التنقل',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        useMaterial3: true,
      ),
      home: const MainMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5E6), // كريمي فاتح
      appBar: AppBar(
        title: const Text(
          '🏠 معمل التنقل',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF8B4513), // بني غامق
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B4513).withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(color: const Color(0xFF8B4513), width: 2),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF8B4513).withOpacity(0.1),
                  child: const Icon(Icons.navigation, color: Color(0xFF8B4513)),
                ),
                title: const Text(
                  '📱 التمرين الأول',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(' (Push & Pop)'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF8B4513)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Exercise1Screen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8B4513).withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(color: const Color(0xFF8B4513), width: 2),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF8B4513).withOpacity(0.1),
                  child: const Icon(Icons.coffee, color: Color(0xFF8B4513)),
                ),
                title: const Text(
                  '☕ التمرين الثاني',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('تمرير وإرجاع البيانات - كوفي شوب'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF8B4513)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Exercise2Screen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}