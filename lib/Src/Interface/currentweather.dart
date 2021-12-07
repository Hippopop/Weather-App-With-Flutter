import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_project/Src/Modules/apimodule.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  bool showLoading = true;

   @override
  void didChangeDependencies() {
    Provider.of<MainWeatherData>(context).dataFetcher().then((value) {
    setState(() {
      showLoading = false;
    });
    });
    super.didChangeDependencies();
  }
  /*@override
  void initState() {
    Provider.of<MainWeatherData>(context).dataFetcher().then((value) {
      setState(() {
        showLoading = false;
      });
    });
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: Consumer<MainWeatherData>(
        builder: (context, value, child) => (showLoading)
            ? const Center(child: CircularProgressIndicator())
            : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height * 0.350,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(5),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("${value.getMainWeatherData.weather[0].main}", style: TextStyle(fontWeight: FontWeight.w800),),
                          ),
                          Container(
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                    "Assets/icons/icons8-thermometer-50.png",
                                    color: Colors.white,
                                    scale: 1.5,
                                  ),
                                   Text(
                                    "${value.getMainWeatherData.main.temp}"+"\u2103",
                                    style: TextStyle(
                                        fontSize: 24, fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.network(
                                "https://cdn.pixabay.com/photo/2016/03/18/15/06/starkbewolkt-1265202__340.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Location : ", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),),
                            Text("${value.getMainWeatherData.name}, ${value.getMainWeatherData.sys.country}.", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontSize: 22),),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Card(
                    color: Color(0x222ffffff),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      height: height * 0.080,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(padding: EdgeInsets.all(5), child: Image.asset("Assets/icons/icons8-wind-gauge-100.png")),
                          ),
                          const Expanded(
                            flex: 10,
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text("Wind Speed"),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Text("${value.getMainWeatherData.wind.speed}"),
                                Text("km/hour", style: Theme.of(context).textTheme.subtitle1,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0x222ffffff),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      height: height * 0.080,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset("Assets/icons/icons8-pressure-gauge-100.png"),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text("Pressure"),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Text("${value.getMainWeatherData.main.pressure}"),
                                Text("pas", style: Theme.of(context).textTheme.subtitle1,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0x222ffffff),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      height: height * 0.080,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset("Assets/icons/icons8-moisture-100.png"),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text("Humidity"),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Text("${value.getMainWeatherData.main.humidity}"),
                                Text("", style: Theme.of(context).textTheme.subtitle1,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0x222ffffff),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      height: height * 0.080,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset("Assets/icons/icons8-dust-100.png", color: Colors.lightBlueAccent,),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text("Visibility"),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Text("${value.getMainWeatherData.visibility}"),
                                Text("", style: Theme.of(context).textTheme.subtitle1,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Color(0x222ffffff),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      height: height * 0.080,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset("Assets/icons/icons8-haze-100-2.png"),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text("Sunrise"),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Text("${value.getMainWeatherData.sys.sunrise}"),
                                Text("", style: Theme.of(context).textTheme.subtitle1,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
