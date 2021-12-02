import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as web;

class MainWeatherData with ChangeNotifier{
  late ModelClass _modelClass;

  ModelClass get getMainWeatherData => _modelClass;

  Future<ModelClass> dataFetcher() async {
    String url = "https://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=98020120367c4f6853e78032308972cd";
    var jsonResponse = await web.get(Uri.parse(url));

    if (jsonResponse.statusCode == 200) {

      Map<String, dynamic> decodedJson = json.decode(jsonResponse.body);
      ModelClass decodedData = ModelClass.fromJson(decodedJson);
      //print(decodedData.visibility);
      notifyListeners();
      return decodedData;

    } else {
      throw "Didn't received the data from web!!";
    }
  }
}



ModelClass modelClassFromJson(String str) => ModelClass.fromJson(json.decode(str));

String modelClassToJson(ModelClass data) => json.encode(data.toJson());

class ModelClass {
  ModelClass({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
    coord: Coord.fromJson(json["coord"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    base: json["base"],
    main: Main.fromJson(json["main"]),
    visibility: json["visibility"],
    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    dt: json["dt"],
    sys: Sys.fromJson(json["sys"]),
    timezone: json["timezone"],
    id: json["id"],
    name: json["name"],
    cod: json["cod"],
  );

  Map<String, dynamic> toJson() => {
    "coord": coord.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "base": base,
    "main": main.toJson(),
    "visibility": visibility,
    "wind": wind.toJson(),
    "clouds": clouds.toJson(),
    "dt": dt,
    "sys": sys.toJson(),
    "timezone": timezone,
    "id": id,
    "name": name,
    "cod": cod,
  };
}

class Clouds {
  Clouds({
    required this.all,
  });

  final int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  final double lon;
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
  };
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json["type"],
    id: json["id"],
    country: json["country"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double speed;
  final int deg;
  final double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"].toDouble(),
    deg: json["deg"],
    gust: json["gust"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}















/*

class ModelClass {
  String base;
  final visibility;
  final dt;
  final timezone;
  final id;
  String name;
  final cod;
  Coord coord;

  ModelClass(
      {
        required this.base,
        required this.visibility,
        required this.dt,
        required this.timezone,
        required this.id,
        required this.name,
        required this.cod,
        required this.coord,
      });

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    Coord coord;
    coord = Coord.fromJson(json['coord']);
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


    return ModelClass(base: base, visibility: visibility, dt: dt, timezone: timezone, id: id, name: name, cod: cod, coord: coord);
  }

  String get getName => name;

*/
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
*//*

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

*/
