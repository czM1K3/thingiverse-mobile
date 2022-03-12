import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:thingiversemobile/components/layout.dart';
import 'package:thingiversemobile/pages/detail.dart';
import 'package:thingiversemobile/pages/newest.dart';
import 'package:thingiversemobile/pages/popular.dart';
import 'package:thingiversemobile/routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: routes.popular,
      routes: {
        routes.newest: (context) => const Layout(
              body: NewestPage(),
              title: "Newest",
            ),
        routes.popular: (context) => const Layout(
              body: PopularPage(),
              title: "Popular",
            ),
        routes.detail: (context) => DetailPage(
              arguments: ModalRoute.of(context)?.settings.arguments,
            ),
      },
    );
  }
}
