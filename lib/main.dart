import 'package:flutter/material.dart';
import 'package:personal_reviews/core/database/app_database.dart';
import 'style/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Show a loading screen while the database is initializing and migrations are running

  // Initialize the database and run migrations before running the app
  await AppDatabase.instance.database;

  runApp(const MainApp());
}

// Make it easier to access theme properties from the context
// Before: Theme.of(context).textTheme.displayMedium
// After: context.textTheme.displayMedium
extension ThemeContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      darkTheme: appTheme,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: SafeArea(
          child: Padding (
            padding: EdgeInsets.all(16.0),
            child: Column(
                children: [
                  Text('Hello World!'),
                  Text('Welcome to Flutter!'),
                  Row(
                    children: [
                      Text('This is a row.'),
                      Text('It contains multiple widgets.')
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
