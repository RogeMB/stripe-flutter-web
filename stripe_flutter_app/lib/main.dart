import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StripeAPP',
      routes: {
        'home': (_) => const HomePage(),
        'order': (_) => const OrderPage(),
      },
      initialRoute: 'home',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        primaryColor: const Color(0xFF284879),
        scaffoldBackgroundColor: const Color(0xFF21232A),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
