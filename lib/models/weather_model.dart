// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  String source;
  String pvTn;
  String pvEn;
  int pvIdn;
  DateTime time;
  double temperature;
  double dewPoint;
  double humidity;
  double pressureSurfaceLevel;
  double visibility;
  double windDirection;
  double windSpeed;
  double rainIntensity;
  int cloudCover;
  DateTime forecastTimeAdjusted;
  double precipitaionProbability;
  DatetimeThai datetimeThai;
  DatetimeEng datetimeEng;

  WeatherModel({
    required this.source,
    required this.pvTn,
    required this.pvEn,
    required this.pvIdn,
    required this.time,
    required this.temperature,
    required this.dewPoint,
    required this.humidity,
    required this.pressureSurfaceLevel,
    required this.visibility,
    required this.windDirection,
    required this.windSpeed,
    required this.rainIntensity,
    required this.cloudCover,
    required this.forecastTimeAdjusted,
    required this.precipitaionProbability,
    required this.datetimeThai,
    required this.datetimeEng,
  });

  WeatherModel copyWith({
    String? source,
    String? pvTn,
    String? pvEn,
    int? pvIdn,
    DateTime? time,
    double? temperature,
    double? dewPoint,
    double? humidity,
    double? pressureSurfaceLevel,
    double? visibility,
    double? windDirection,
    double? windSpeed,
    double? rainIntensity,
    int? cloudCover,
    DateTime? forecastTimeAdjusted,
    double? precipitaionProbability,
    DatetimeThai? datetimeThai,
    DatetimeEng? datetimeEng,
  }) => WeatherModel(
    source: source ?? this.source,
    pvTn: pvTn ?? this.pvTn,
    pvEn: pvEn ?? this.pvEn,
    pvIdn: pvIdn ?? this.pvIdn,
    time: time ?? this.time,
    temperature: temperature ?? this.temperature,
    dewPoint: dewPoint ?? this.dewPoint,
    humidity: humidity ?? this.humidity,
    pressureSurfaceLevel: pressureSurfaceLevel ?? this.pressureSurfaceLevel,
    visibility: visibility ?? this.visibility,
    windDirection: windDirection ?? this.windDirection,
    windSpeed: windSpeed ?? this.windSpeed,
    rainIntensity: rainIntensity ?? this.rainIntensity,
    cloudCover: cloudCover ?? this.cloudCover,
    forecastTimeAdjusted: forecastTimeAdjusted ?? this.forecastTimeAdjusted,
    precipitaionProbability:
        precipitaionProbability ?? this.precipitaionProbability,
    datetimeThai: datetimeThai ?? this.datetimeThai,
    datetimeEng: datetimeEng ?? this.datetimeEng,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    source: json["source"],
    pvTn: json["pv_tn"],
    pvEn: json["pv_en"],
    pvIdn: json["pv_idn"],
    time: DateTime.parse(json["time"]),
    temperature: json["temperature"]?.toDouble(),
    dewPoint: json["dewPoint"]?.toDouble(),
    humidity: json["humidity"],
    pressureSurfaceLevel: json["pressureSurfaceLevel"]?.toDouble(),
    visibility: json["visibility"]?.toDouble(),
    windDirection: json["windDirection"],
    windSpeed: json["windSpeed"]?.toDouble(),
    rainIntensity: json["rainIntensity"],
    cloudCover: json["cloudCover"],
    forecastTimeAdjusted: DateTime.parse(json["forecast_time_adjusted"]),
    precipitaionProbability: json["precipitaionProbability"]?.toDouble(),
    datetimeThai: DatetimeThai.fromJson(json["datetimeThai"]),
    datetimeEng: DatetimeEng.fromJson(json["datetimeEng"]),
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "pv_tn": pvTn,
    "pv_en": pvEn,
    "pv_idn": pvIdn,
    "time": time.toIso8601String(),
    "temperature": temperature,
    "dewPoint": dewPoint,
    "humidity": humidity,
    "pressureSurfaceLevel": pressureSurfaceLevel,
    "visibility": visibility,
    "windDirection": windDirection,
    "windSpeed": windSpeed,
    "rainIntensity": rainIntensity,
    "cloudCover": cloudCover,
    "forecast_time_adjusted": forecastTimeAdjusted.toIso8601String(),
    "precipitaionProbability": precipitaionProbability,
    "datetimeThai": datetimeThai.toJson(),
    "datetimeEng": datetimeEng.toJson(),
  };
}

class DatetimeEng {
  String dateEng;
  String timeEng;

  DatetimeEng({required this.dateEng, required this.timeEng});

  DatetimeEng copyWith({String? dateEng, String? timeEng}) => DatetimeEng(
    dateEng: dateEng ?? this.dateEng,
    timeEng: timeEng ?? this.timeEng,
  );

  factory DatetimeEng.fromJson(Map<String, dynamic> json) =>
      DatetimeEng(dateEng: json["dateEng"], timeEng: json["timeEng"]);

  Map<String, dynamic> toJson() => {"dateEng": dateEng, "timeEng": timeEng};
}

class DatetimeThai {
  String dateThai;
  String timeThai;

  DatetimeThai({required this.dateThai, required this.timeThai});

  DatetimeThai copyWith({String? dateThai, String? timeThai}) => DatetimeThai(
    dateThai: dateThai ?? this.dateThai,
    timeThai: timeThai ?? this.timeThai,
  );

  factory DatetimeThai.fromJson(Map<String, dynamic> json) =>
      DatetimeThai(dateThai: json["dateThai"], timeThai: json["timeThai"]);

  Map<String, dynamic> toJson() => {"dateThai": dateThai, "timeThai": timeThai};
}
