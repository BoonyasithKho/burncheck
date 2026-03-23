part of 'market_bloc.dart';

abstract class MarketEvent extends Equatable {
  const MarketEvent();

  @override
  List<Object> get props => [];
}

class MarkerEventTypeSelect extends MarketEvent {
  final int typeSelected;
  const MarkerEventTypeSelect({required this.typeSelected});
}

class MarkerEventAgriWasteSelect extends MarketEvent {
  final int agriWasteSelected;
  const MarkerEventAgriWasteSelect({required this.agriWasteSelected});
}

class MarkerEventScoreSelect extends MarketEvent {
  final int scoreSelected;
  const MarkerEventScoreSelect({required this.scoreSelected});
}

class MarkerEventRangeSelect extends MarketEvent {
  final int rangeSelect;
  const MarkerEventRangeSelect({required this.rangeSelect});
}

class MarkerEventPriceSelect extends MarketEvent {
  final RangeValues priceRange;
  const MarkerEventPriceSelect({required this.priceRange});
}
