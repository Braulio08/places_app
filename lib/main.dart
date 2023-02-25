import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import './providers/places_provider.dart';
import 'package:provider/provider.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './screens/place_detail_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
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
          routes: {
            AddPlaceScreen.routeName: (context) => const AddPlaceScreen(),
            PlaceDetailsScreen.routeName: (context) => const PlaceDetailsScreen(),
          },
        ),
      );
    });
  }
}
