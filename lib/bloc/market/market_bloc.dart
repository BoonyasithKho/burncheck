import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc()
    : super(
        MarketState(
          typeSelected: 0,
          agriWasteSelected: 0,
          scoreSelected: 0,
          rangeSelect: 10,
          priceRange: RangeValues(0, 100),
        ),
      ) {
    on<MarkerEventTypeSelect>(onTypeSelection);
    on<MarkerEventAgriWasteSelect>(onAgriWasteSelection);
    on<MarkerEventScoreSelect>(onScoreSelection);
    on<MarkerEventRangeSelect>(onRangeSelection);
    on<MarkerEventPriceSelect>(onPriceSelecton);
  }

  Future<void> onTypeSelection(
    MarkerEventTypeSelect event,
    Emitter<MarketState> emit,
  ) async {
    emit(state.copyWith(typeSelected: event.typeSelected));
  }

  Future<void> onAgriWasteSelection(
    MarkerEventAgriWasteSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(agriWasteSelected: event.agriWasteSelected));
  }

  Future<void> onScoreSelection(
    MarkerEventScoreSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(scoreSelected: event.scoreSelected));
  }

  Future<void> onRangeSelection(
    MarkerEventRangeSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(rangeSelect: event.rangeSelect));
  }

  Future<void> onPriceSelecton(
    MarkerEventPriceSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(priceRange: event.priceRange));
  }
}
