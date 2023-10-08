import 'package:cost_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(240, 0, 25, 86),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.primary),
        cardTheme:
            const CardTheme().copyWith(color: kColorScheme.primaryContainer),
        textTheme: ThemeData().textTheme.copyWith(
              titleMedium: const TextStyle(
                color: Colors.indigo,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
      ),
      home: const Expenses(),
    );
  }
}
