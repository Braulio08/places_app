import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import './providers/places_provider.dart';
import 'package:provider/provider.dart';
import './screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PlacesProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Great places',
          theme: ThemeData(
            colorScheme: lightColorScheme ?? MyApp._defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? MyApp._defaultDarkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,
          home: const PlacesListScreen(),
        ),
      );
    });
  }
}
