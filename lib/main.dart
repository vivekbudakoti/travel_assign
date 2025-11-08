import 'package:flutter/material.dart';
import 'package:travel_assign/features/onboarding/view/splash_screen.dart';
import 'package:travel_assign/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Assignment',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      localizationsDelegates: const [AppLocalizations.delegate],
      supportedLocales: const [Locale('en')],
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("data"),
          Image.network(
            "https://images.unsplash.com/photo-1567597243073-2d274aabecec?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fFBlcnV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=900",
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 2,
          ),
        ],
      ),
    );
  }
}
