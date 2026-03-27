// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  final String source;
  final String province;
  final DateTime time;
  final double temperature;
  final double dewPoint;
  final int humidity;
  final double pressureSurfaceLevel;
  final int visibility;
  final int windDirection;
  final int windSpeed;
  final int rainIntensity;
  final int cloudCover;

  WeatherModel({
    required this.source,
    required this.province,
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
  });

  WeatherModel copyWith({
    String? source,
    String? province,
    DateTime? time,
    double? temperature,
    double? dewPoint,
    int? humidity,
    double? pressureSurfaceLevel,
    int? visibility,
    int? windDirection,
    int? windSpeed,
    int? rainIntensity,
    int? cloudCover,
  }) => WeatherModel(
    source: source ?? this.source,
    province: province ?? this.province,
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
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    source: json["source"],
    province: json["province"],
    time: DateTime.parse(json["time"]),
    temperature: json["temperature"],
    dewPoint: json["dewPoint"]?.toDouble(),
    humidity: json["humidity"],
    pressureSurfaceLevel: json["pressureSurfaceLevel"]?.toDouble(),
    visibility: json["visibility"],
    windDirection: json["windDirection"],
    windSpeed: json["windSpeed"],
    rainIntensity: json["rainIntensity"],
    cloudCover: json["cloudCover"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "province": province,
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
  };
}
