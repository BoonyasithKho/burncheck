import 'dart:convert';

import 'package:burncheck/models/pm25_model.dart';
import 'package:burncheck/models/weather_model.dart';
import 'package:burncheck/utils/my_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainpageBloc extends Bloc<MainpageEvent, MainpageState> {
  MainpageBloc()
    : super(
        MainpageState(
          screenSelect: 0,
          userLocation: [14, 100],
          pm25Value: 0,
          pm25Update: '',
          pmSituation: 0,
          tempValue: 0,
          rainProp: 0,
          windSpeed: 0,
          lat: '',
          lng: '',
          tambon: '',
          amphoe: '',
          province: '',
        ),
      ) {
    on<MainpageEventScreenSelect>(onScreenSelect);
    on<MainpageEventGetUserLocation>(onGetLocation);
    on<MainpageEventGetPM25>(onGetPM25Value);
    on<MainpageEventGetWeather>(onGetWeatherValue);
  }

  // Parameter
  Future<LocationPermission>? permRequest;
  Future<Position?>? posRequest;

  Future<void> onScreenSelect(
    MainpageEventScreenSelect event,
    Emitter<MainpageState> emit,
  ) async {
    emit(state.copyWith(screenSelect: event.screenNo));
  }

  Future<void> onGetLocation(
    MainpageEventGetUserLocation event,
    Emitter<MainpageState> emit,
  ) async {
    emit(state.copyWith(localtionStatus: LocationStatus.loading));
    try {
      final pos = await safeGetCurrentPosition();
      if (pos == null) {
        final serviceEnabled = await Geolocator.isLocationServiceEnabled();
        emit(
          state.copyWith(
            localtionStatus: serviceEnabled
                ? LocationStatus.denied
                : LocationStatus.serviceOff,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          localtionStatus: LocationStatus.ready,
          lat: pos.latitude.toString(),
          lng: pos.longitude.toString(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(localtionStatus: LocationStatus.error));
    }
  }

  Future<void> onGetPM25Value(
    MainpageEventGetPM25 event,
    Emitter<MainpageState> emit,
  ) async {
    final pos = await safeGetCurrentPosition();

    if (pos != null) {
      final pm25 = await getPM25Value([pos.latitude, pos.longitude]);
      emit(
        state.copyWith(
          tambon: pm25[0] ?? '',
          amphoe: pm25[1] ?? '',
          province: pm25[2] ?? '',
          pmStatus: PmStatus.ready,
          pm25Value: pm25[3].round() ?? '',
          pmSituation: pm25[6] ?? '',
          pm25Update: '${pm25[7]} ${pm25[8]}',
        ),
      );
    } else {
      emit(state.copyWith(pm25Value: 0));
    }
  }

  Future<void> onGetWeatherValue(
    MainpageEventGetWeather event,
    Emitter<MainpageState> emit,
  ) async {
    final pos = await safeGetCurrentPosition();
    if (pos != null) {
      final weather = await getWeather([
        pos.latitude,
        pos.longitude,
      ], 'กรุงเทพมหานคร');
      emit(
        state.copyWith(
          tempValue: weather[0],
          rainProp: 0,
          windSpeed: weather[1],
        ),
      );
    }
  }

  // Get PM25 function
  Future<List<dynamic>> getPM25Value(List<double> userPosition) async {
    final requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final url = Uri.parse(
      "${MyApi.urlPM25Home}?lat=${userPosition[0]}&lng=${userPosition[1]}",
    );
    final response = await http
        .get(url, headers: requestHeaders)
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception("Can't get Data (${response.statusCode})");
    }

    final Map<String, dynamic> data = jsonDecode(response.body);
    final dataObject = PmCurrentPositionModel.fromJson(data);
    int pmSituation = 0;

    switch (dataObject.data.pm25) {
      case <= 15:
        pmSituation = 0;
        break;
      case > 15 && <= 25:
        pmSituation = 1;
        break;
      case > 25 && <= 37.5:
        pmSituation = 2;
        break;
      case > 37.5 && <= 75:
        pmSituation = 3;
        break;
      case > 75:
        pmSituation = 4;
        break;
      default:
        pmSituation = 0;
    }
    return [
      dataObject.data.loc.tbTn,
      dataObject.data.loc.apTn,
      dataObject.data.loc.pvTn,
      dataObject.data.pm25,
      dataObject.data.pm25Avg24Hrs,
      dataObject.data.graphHistory24Hrs,
      pmSituation,
      dataObject.data.datetimeThai.dateThai,
      dataObject.data.datetimeThai.timeThai,
    ];
  }

  // Get Weather function
  Future<List<dynamic>> getWeather(
    List<double> userPosition,
    String province,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-api-key': MyApi.weatherApiKey,
    };
    final url = "${MyApi.urlDataWeather}?Culture=th-TH&FilterText=$province";
    final response = await http.get(Uri.parse(url), headers: requestHeaders);
    int weatherConditon = 9;
    dynamic temperature = '';
    int windSpeed = 0;
    String showUpdate = '';

    if (response.statusCode == 200) {
      var responseJson = WeatherModel.fromJson(jsonDecode(response.body));
      temperature = responseJson.temperature;
      windSpeed = responseJson.windSpeed;

      DateTime checkDateUpdate = DateTime.parse("${responseJson.time}");

      String updateDate = checkDateUpdate.month < 10
          ? checkDateUpdate.day < 10
                ? '0${checkDateUpdate.day}/0${checkDateUpdate.month}/${checkDateUpdate.year}'
                : '${checkDateUpdate.day}/0${checkDateUpdate.month}/${checkDateUpdate.year}'
          : checkDateUpdate.day < 10
          ? '0${checkDateUpdate.day}/${checkDateUpdate.month}/${checkDateUpdate.year}'
          : '${checkDateUpdate.day}/${checkDateUpdate.month}/${checkDateUpdate.year}';
      String updateTime = '${checkDateUpdate.hour + 7}:00';

      String updatetimeThai = 'วันที่ $updateDate เวลา $updateTime น.';
      String updateDateEng = 'at $updateDate $updateTime';

      int localSelect = 0;

      if (localSelect == 0) {
        showUpdate = updatetimeThai;
      } else {
        showUpdate = updateDateEng;
      }

      dynamic cloud = responseJson.cloudCover;
      dynamic rainfall = responseJson.rainIntensity;

      if (rainfall >= 90.1) {
        weatherConditon = 0;
      } else if (rainfall >= 35.1) {
        weatherConditon = 1;
      } else if (rainfall >= 10.1) {
        weatherConditon = 2;
      } else if (rainfall >= 0.1) {
        weatherConditon = 3;
      } else if (rainfall == 0 && cloud > 9) {
        weatherConditon = 4;
      } else if (rainfall == 0 && cloud > 8) {
        weatherConditon = 5;
      } else if (rainfall == 0 && cloud > 5) {
        weatherConditon = 6;
      } else if (rainfall == 0 && cloud > 3) {
        weatherConditon = 7;
      } else if (rainfall == 0 && cloud >= 1) {
        weatherConditon = 8;
      } else {
        weatherConditon = 9;
      }
    }
    return [temperature.round(), windSpeed, showUpdate, weatherConditon];
  }

  // Get Current Position
  Future<Position?> safeGetCurrentPosition() {
    if (posRequest != null) return posRequest!;

    posRequest =
        () async {
          final serviceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!serviceEnabled) return null;

          final permission = await requestPermissionSerialized();
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            return null;
          }

          try {
            final pos = await Geolocator.getCurrentPosition(
              locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.high,
                timeLimit: Duration(seconds: 10),
              ),
            );
            return pos;
          } catch (_) {
            return await Geolocator.getLastKnownPosition();
          }
        }().whenComplete(() {
          posRequest = null;
        });

    return posRequest!;
  }

  // Request Location Permission
  Future<LocationPermission> requestPermissionSerialized() {
    if (permRequest != null) return permRequest!;

    permRequest =
        () async {
          var permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
          }
          return permission;
        }().whenComplete(() {
          permRequest = null;
        });
    return permRequest!;
  }
}
