import 'package:breaking_bad/controller/quotes_provider.dart';
import 'package:breaking_bad/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuotesProvider()),
      ],
      child: const MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'Breaking Bad',
        home: HomeScreen(),
      ),
    );
  }
}
