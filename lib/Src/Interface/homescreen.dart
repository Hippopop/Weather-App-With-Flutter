import 'package:flutter/material.dart';
import 'package:weather_app_project/Src/Interface/currentweather.dart';
import 'package:weather_app_project/Src/Interface/weatherforecast.dart';
import 'package:weather_app_project/Src/Modules/apimodule.dart';

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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
/*
            image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1588392382834-a891154bca4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG5hdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
              ),
              fit: BoxFit.cover,
            ),
*/
          gradient: LinearGradient(
              colors: [
                Color(0xfff62c3d9),
                Color(0xfff59ccd9),
                Color(0xfff4bb4bf),
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text("Weather", style: Theme.of(context).textTheme.bodyText1,),
          backgroundColor: Color(0x333ffffff),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
               Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("Current Weather", style: Theme.of(context).textTheme.subtitle1,),
               ),
               Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text("Weather Forecast", style: Theme.of(context).textTheme.subtitle1,),
               ),
            ],
          ),
      ),
            body: Container(
              child: const TabBarView(
                children: [
                  CurrentWeather(),
                  WeatherForecast(),
                ],
              ),
            )
    ),
        ));
  }
}
