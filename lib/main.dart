import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_offline/pages/home_page.dart';
import 'package:quran_offline/providers/list_quran_provider.dart';
import 'package:quran_offline/utils/navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  late ListQuranProvider listQuranProvider;

  @override
  void initState() {
    super.initState();
    listQuranProvider = ListQuranProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: listQuranProvider),
        ],
        child: MaterialApp(
          theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity),
          navigatorKey: navigatorKey,
          initialRoute: HomePage.routeName,
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.routeName: (_) => const HomePage(),
          },
        ),
    );
  }
}
