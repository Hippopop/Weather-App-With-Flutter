import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app_project/Src/Interface/homescreen.dart';
import 'package:weather_app_project/Src/Modules/apimodule.dart';

void main() {
  runApp(
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => MainWeatherData()),
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

      theme: ThemeData.light().copyWith(

        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: "Raleway",
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 32,
          ),
            bodyText2: TextStyle(
              fontFamily: "Raleway",
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
            subtitle1: TextStyle(
              fontFamily: "Raleway",
              color: Colors.white,
              fontSize: 18,
            )
        )
      ),

      home: const HomeScreen(),


    );
  }
}