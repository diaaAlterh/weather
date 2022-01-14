import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  String cod;
  int message;
  int cnt;
  List<ListElement>? list;
  City? city;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        cod: json["cod"] == null ? null : json["cod"],
        message: json["message"] == null ? null : json["message"],
        cnt: json["cnt"] == null ? null : json["cnt"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod == null ? null : cod,
        "message": message == null ? null : message,
        "cnt": cnt == null ? null : cnt,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "city": city == null ? null : city?.toJson(),
      };
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  int id;
  String name;
  Coord? coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        country: json["country"] == null ? null : json["country"],
        population: json["population"] == null ? null : json["population"],
        timezone: json["timezone"] == null ? null : json["timezone"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "coord": coord == null ? null : coord!.toJson(),
        "country": country == null ? null : country,
        "population": population == null ? null : population,
        "timezone": timezone == null ? null : timezone,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
      };
}

class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });

  double lat;
  double lon;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
      };
}

class ListElement {
  ListElement({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    required this.rain,
  });

  int? dt;
  Main? main;
  List<WeatherElement>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  DateTime? dtTxt;
  Rain? rain;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"] == null ? null : json["dt"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        weather: json["weather"] == null
            ? null
            : List<WeatherElement>.from(
                json["weather"].map((x) => WeatherElement.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        visibility: json["visibility"] == null ? null : json["visibility"],
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt == null ? null : dt,
        "main": main == null ? null : main?.toJson(),
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds == null ? null : clouds?.toJson(),
        "wind": wind == null ? null : wind?.toJson(),
        "visibility": visibility == null ? null : visibility,
        "pop": pop == null ? null : pop,
        "sys": sys == null ? null : sys?.toJson(),
        "dt_txt": dtTxt == null ? null : dtTxt?.toIso8601String(),
        "rain": rain == null ? null : rain?.toJson(),
      };
}

class Clouds {
  Clouds({
    required this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] == null ? null : json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all == null ? null : all,
      };
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        seaLevel: json["sea_level"] == null ? null : json["sea_level"],
        grndLevel: json["grnd_level"] == null ? null : json["grnd_level"],
        humidity: json["humidity"] == null ? null : json["humidity"],
        tempKf: json["temp_kf"] == null ? null : json["temp_kf"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "temp_min": tempMin == null ? null : tempMin,
        "temp_max": tempMax == null ? null : tempMax,
        "pressure": pressure == null ? null : pressure,
        "sea_level": seaLevel == null ? null : seaLevel,
        "grnd_level": grndLevel == null ? null : grndLevel,
        "humidity": humidity == null ? null : humidity,
        "temp_kf": tempKf == null ? null : tempKf,
      };
}

class Rain {
  Rain({
    required this.the3H,
  });

  double the3H;

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"] == null ? null : json["3h"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "3h": the3H == null ? null : the3H,
      };
}

class Sys {
  Sys({
    required this.pod,
  });

  String pod;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: json["pod"] == null ? null : json["pod"],
      );

  Map<String, dynamic> toJson() => {
        "pod": pod == null ? null : pod,
      };
}

class WeatherElement {
  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : main,
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
      };
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  double speed;
  int deg;
  double gust;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? null : json["speed"].toDouble(),
        deg: json["deg"] == null ? null : json["deg"],
        gust: json["gust"] == null ? null : json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed == null ? null : speed,
        "deg": deg == null ? null : deg,
        "gust": gust == null ? null : gust,
      };
}
