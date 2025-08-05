import 'package:conclusion/config/config.dart';
import 'package:conclusion/plugin/engine.dart';
import 'package:conclusion/view/pages/search.dart';
import 'package:conclusion/view/pages/settings.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:dynamic_system_colors/dynamic_system_colors.dart';
import 'package:flutter/material.dart';
import 'package:rhttp/rhttp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Rhttp.init();
  await JavaScriptEngine.init();
  await AppConfigKeys.initialize();
  OpenAI.apiKey = AppConfigValues.apikey ?? "";

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        title: 'Conclusion.AI',
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: lightDynamic),
        darkTheme: ThemeData(colorScheme: darkDynamic),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Conclusion.AI",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SearchPage(),
    );
  }
}
