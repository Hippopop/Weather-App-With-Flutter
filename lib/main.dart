import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app_project/Src/Interface/homescreen.dart';
import 'package:weather_app_project/Src/Modules/apimodule.dart';

void main() {
  runApp(
MultiProvider(
  providers: [
    Provider (create: (context) => MainWeatherData()),
],
child: const MyApp(),
),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Weather App",

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const HomeScreen(),


    );
  }
}