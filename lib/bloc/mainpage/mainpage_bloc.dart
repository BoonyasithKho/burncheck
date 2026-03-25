import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mainpage_event.dart';
part 'mainpage_state.dart';

class MainpageBloc extends Bloc<MainpageEvent, MainpageState> {
  MainpageBloc()
    : super(
        MainpageState(
          screenSelect: 0,
          userLocation: [14, 100],
          pm25Value: 0,
          tempValue: 0.0,
          rainProp: 0,
          windSpeed: 0,
        ),
      ) {
    on<MainpageEventScreenSelect>(onScreenSelect);
    on<MainpageEventGetUserLocation>(onGetLocation);
    on<MainpageEventGetPM25>(onGetPM25Value);
    on<MainpageEventGetWeather>(onGetWeatherValue);
  }

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
    emit(state.copyWith(userLocation: [14, 100]));
  }

  Future<void> onGetPM25Value(
    MainpageEventGetPM25 event,
    Emitter<MainpageState> emit,
  ) async {
    final pm25 = getPM25Value(event.userPosition);
    emit(state.copyWith(pm25Value: pm25));
  }

  Future<void> onGetWeatherValue(
    MainpageEventGetWeather event,
    Emitter<MainpageState> emit,
  ) async {
    emit(state.copyWith(tempValue: 0.0, rainProp: 0, windSpeed: 0));
  }

  double getPM25Value(List<double> userPosition) {
    print('${userPosition[0]}, ${userPosition[1]}');
    return 0.0;
  }
}
