import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/notification_service.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("Firebase initialization error: $e");
  }

  try {
    await NotificationService().initialize();
  } catch (e) {
    debugPrint("Notification service error: $e");
  }

  runApp(const KachaBazaarApp());
}

class KachaBazaarApp extends StatelessWidget {
  const KachaBazaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kacha Bazaar',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
      home: const HomeScreen(),
    );
  }
}
