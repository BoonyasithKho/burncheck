part of 'mainpage_bloc.dart';

enum LocationStatus { initial, loading, ready, denied, serviceOff, error }

enum PmStatus { initial, loading, ready, error }

class MainpageState extends Equatable {
  final int screenSelect;
  final List<double> userLocation;
  final PmStatus pmStatus;
  final String pm25Update;
  final int pm25Value;
  final int pmSituation;
  final int tempValue;
  final int rainProp;
  final int windSpeed;
  final LocationStatus localtionStatus;
  final String lat;
  final String lng;
  final String tambon;
  final String amphoe;
  final String province;

  const MainpageState({
    required this.screenSelect,
    required this.userLocation,
    this.pmStatus = PmStatus.initial,
    required this.pm25Value,
    required this.pm25Update,
    required this.pmSituation,
    required this.tempValue,
    required this.rainProp,
    required this.windSpeed,
    this.localtionStatus = LocationStatus.initial,
    required this.lat,
    required this.lng,
    required this.tambon,
    required this.amphoe,
    required this.province,
  });

  MainpageState copyWith({
    int? screenSelect,
    List<double>? userLocation,
    PmStatus? pmStatus,
    int? pm25Value,
    String? pm25Update,
    int? pmSituation,
    int? tempValue,
    int? rainProp,
    int? windSpeed,
    LocationStatus? localtionStatus,
    String? lat,
    String? lng,
    String? tambon,
    String? amphoe,
    String? province,
  }) {
    return MainpageState(
      screenSelect: screenSelect ?? this.screenSelect,
      userLocation: userLocation ?? this.userLocation,
      pmStatus: pmStatus ?? this.pmStatus,
      pm25Value: pm25Value ?? this.pm25Value,
      pm25Update: pm25Update ?? this.pm25Update,
      pmSituation: pmSituation ?? this.pmSituation,
      tempValue: tempValue ?? this.tempValue,
      rainProp: rainProp ?? this.rainProp,
      windSpeed: windSpeed ?? this.windSpeed,
      localtionStatus: localtionStatus ?? this.localtionStatus,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      tambon: tambon ?? this.tambon,
      amphoe: amphoe ?? this.amphoe,
      province: province ?? this.province,
    );
  }

  @override
  List<Object> get props => [
    screenSelect,
    userLocation,
    pmStatus,
    pm25Value,
    pm25Update,
    pmSituation,
    tempValue,
    rainProp,
    windSpeed,
    localtionStatus,
    lat,
    lng,
    tambon,
    amphoe,
    province,
  ];
}
