part of 'mainpage_bloc.dart';

class MainpageState extends Equatable {
  final int screenSelect;
  final List<double> userLocation;
  final double pm25Value;
  final double tempValue;
  final int rainProp;
  final double windSpeed;

  const MainpageState({
    required this.screenSelect,
    required this.userLocation,
    required this.pm25Value,
    required this.tempValue,
    required this.rainProp,
    required this.windSpeed,
  });

  MainpageState copyWith({
    int? screenSelect,
    List<double>? userLocation,
    double? pm25Value,
    double? tempValue,
    int? rainProp,
    double? windSpeed,
  }) {
    return MainpageState(
      screenSelect: screenSelect ?? this.screenSelect,
      userLocation: userLocation ?? this.userLocation,
      pm25Value: pm25Value ?? this.pm25Value,
      tempValue: tempValue ?? this.tempValue,
      rainProp: rainProp ?? this.rainProp,
      windSpeed: windSpeed ?? this.windSpeed,
    );
  }

  @override
  List<Object> get props => [
    screenSelect,
    userLocation,
    pm25Value,
    tempValue,
    rainProp,
    windSpeed,
  ];
}
