import 'package:flutter/material.dart';
import 'package:personal_reviews/database/app_database.dart';
import 'package:personal_reviews/shared/layouts/main_layout.dart';
import 'style/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database and run migrations before running the app
  AppDatabase();

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
      home: MainLayout(
        title: 'Mis reseñas',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello World!'),
            Text('Welcome to Flutter!'),
            Row(
              children: [
                Text('This is a row.'),
                Text('It contains multiple widgets. For e.'),
              ],
            ),
            SizedBox(height: 1000),
            Text('This is the end of the column.'),
          ],
        ),
      ),
    );
  }
}
