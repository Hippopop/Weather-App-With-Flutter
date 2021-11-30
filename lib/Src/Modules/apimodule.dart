import 'dart:convert';
import 'package:http/http.dart' as web;

Future<ModelClass> dataFetcher() async {
  var jsonResponse = await web.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=98020120367c4f6853e78032308972cd"));

  if (jsonResponse.statusCode == 200) {

    Map<String, dynamic> decodedJson = json.decode(jsonResponse.body);
    ModelClass catchedData = ModelClass.fromJson(decodedJson);

    print(catchedData.visibility);

    return catchedData;

  } else {
    throw "Didn't received the data from web!!";
  }
}

class ModelClass {
  String base;
  final visibility;
  final dt;
  final timezone;
  final id;
  String name;
  final cod;

  ModelClass(
      {
        required this.base,
        required this.visibility,
        required this.dt,
        required this.timezone,
        required this.id,
        required this.name,
        required this.cod});

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    Coord.fromJson(json['coord']);
    List frame = json["weather"];
    Weather.fromJson(frame[0]);

    String base = json['base'];
    Main.fromJson(json['main']);
    final visibility = json['visibility'];
    Wind.fromJson(json['wind']);
    Clouds.fromJson(json['clouds']);
    final dt = json['dt'];
    Sys.fromJson(json['sys']);
    final timezone = json['timezone'];
    final id = json['id'];
    String name = json['name'];
    final cod = json['cod'];


    return ModelClass(base: base, visibility: visibility, dt: dt, timezone: timezone, id: id, name: name, cod: cod);
  }

  String get getName => name;

/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

      data['coord'] = coord.toJson();


      data['weather'] = weather.map((v) => v.toJson()).toList();
    data['base'] = base;
      data['main'] = main.toJson();

    data['visibility'] = visibility;

      data['wind'] = wind.toJson();


      data['clouds'] = clouds.toJson();

    data['dt'] = dt;
      data['sys'] = sys.toJson();

    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
*/
}


class Coord {
  final lon;
  final lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    final lon = json['lon'];
    final lat = json['lat'];

    return Coord(lon: lon, lat: lat);
  }
}

class Weather {
  final id;
  String main;
  String description;
  String icon;

  Weather(
      {required this.id,
        required this.main,
        required this.description,
        required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    String main = json['main'];
    String description = json['description'];
    String icon = json['icon'];

    return Weather(id: id, main: main, description: description, icon: icon);
  }
}

class Main {
  final temp;
  final feelsLike;
  final tempMin;
  final tempMax;
  final pressure;
  final humidity;

  Main(
      {required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final feelsLike = json['feels_like'];
    final tempMin = json['temp_min'];
    final tempMax = json['temp_max'];
    final pressure = json['pressure'];
    final humidity = json['humidity'];


    return Main(temp: temp, feelsLike: feelsLike, tempMin: tempMin, tempMax: tempMax, pressure: pressure, humidity: humidity);
  }

}

class Wind {
  final speed;
  final deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    final deg = json['deg'];

    return Wind(speed: speed, deg: deg);
  }

}

class Clouds {
  final all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    final all = json['all'];

    return Clouds(all: all);
  }
}

class Sys {
  final type;
  final id;
  String country;
  final sunrise;
  final sunset;

  Sys(
      {required this.type,
        required this.id,
        required this.country,
        required this.sunrise,
        required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    final id = json['id'];
    String country = json['country'].toString();
    final sunrise = json['sunrise'];
    final sunset = json['sunset'];

   // Clouds clouds;
    //prfinal(clouds.all);


    return Sys(type: type, id: id, country: country, sunrise: sunrise, sunset: sunset);
  }

}

