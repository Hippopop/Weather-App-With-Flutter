import 'package:flutter/material.dart';
import 'package:weather_app_project/Src/Modules/apimodule.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
late  Future<ModelClass> source;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    source = dataFetcher();
  }

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: (height*0.350),
        width: double.infinity,
        child: Card(
          color: Colors.lightBlueAccent,
          child: Column(
            children: const [

            ],
          ),
        ),
      ),
    );
  }
}
