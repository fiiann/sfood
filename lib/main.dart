import 'package:flutter/material.dart';
import 'package:sfood/core/database_local/local_db.dart';

import 'core/routes.dart';

void main() {
  final database = MyDatabase();
  runApp(MyApp(
    router: AppRouter(database),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({super.key, required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SFOOD',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: "list_food",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white),
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}


