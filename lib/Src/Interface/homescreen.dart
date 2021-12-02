import 'package:flutter/material.dart';
import 'package:weather_app_project/Src/Interface/currentweather.dart';
import 'package:weather_app_project/Src/Interface/weatherforecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),

        bottom: const TabBar(
          tabs: [
             Text("Current Weather"),
             Text("Weather Forecast"),
          ],
        ),
      ),
          body: const TabBarView(
            children: [
              CurrentWeather(),
              WeatherForecast(),
            ],
          ),
    ));
  }
}
