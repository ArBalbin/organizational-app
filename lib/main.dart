import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/missionvision_screen.dart';
import 'screens/organizational_chart_screen.dart';
import 'screens/staff_directory_screen.dart';
import 'screens/service_screen.dart';
import 'screens/services_detail_screen.dart';
import 'screens/announcements_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/contact_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF1B5E20);
    const Color accentGreen = Color(0xFF2E7D32);
    const Color lightGreen = Color(0xFF388E3C);
    const Color accentPurple = Color(0xFF6A0DAD);
    const Color background = Color(0xFF0A1F0A);
    const Color surface = Color(0xFF1A3A1A);
    const Color cardColor = Color(0xFF1E3D1E);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NCF Guidance & Testing Center',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        primaryColor: primaryGreen,
        colorScheme: ColorScheme.dark(
          primary: accentGreen,
          secondary: accentPurple,
          tertiary: lightGreen,
          surface: surface,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          // Title style intentionally left minimal — NcfAppBar widget
          // handles its own layout (logo + text row).
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF0D2B0D),
        ),
        cardTheme: CardThemeData(
          color: cardColor,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(color: Colors.white70),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentGreen,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: accentGreen),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: accentGreen.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: accentGreen, width: 2),
          ),
          labelStyle: const TextStyle(color: Colors.white60),
          hintStyle: const TextStyle(color: Colors.white38),
        ),
        dividerColor: Colors.white12,
        iconTheme: const IconThemeData(color: Colors.white70),
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/mission-vision': (context) => const MissionVisionScreen(),
        '/org-chart': (context) => const OrganizationalChartScreen(),
        '/staff': (context) => const StaffDirectoryScreen(),
        '/services': (context) => ServiceScreen(),
        '/announcements': (context) => const AnnouncementsScreen(),
        '/faq': (context) => const FaqScreen(),
        '/contact': (context) => const ContactScreen(),
      },
    );
  }
}