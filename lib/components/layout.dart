import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key, required this.body, this.title}) : super(key: key);

  final Widget body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? "Thingiverse Mobile"),
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("assets/placeholder.png"),
            ),
            ListTile(
              title: const Text('Popular'),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/popular");
              },
            ),
            ListTile(
              title: const Text('Newest'),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/newest");
              },
            ),
          ],
        ),
      ),
    );
  }
}
