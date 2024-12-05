import 'package:exam_api/controller/favorite_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Routes/routes.dart';

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoritesProvider(),
        )
      ],
      builder: (context, child) => child!,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.myRoutes,
      ),
    );
  }
}
