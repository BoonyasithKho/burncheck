part of 'market_bloc.dart';

abstract class MarketEvent extends Equatable {
  const MarketEvent();

  @override
  List<Object> get props => [];
}

// Filter : Select Post Type
class MarkerEventTypeSelect extends MarketEvent {
  final int typeSelected;
  const MarkerEventTypeSelect({required this.typeSelected});
}

// Filter : Select Product Type Name
class MarkerEventAgriWasteSelect extends MarketEvent {
  final int agriWasteSelected;
  const MarkerEventAgriWasteSelect({required this.agriWasteSelected});
}

// Filter : Select Rating Score
class MarkerEventScoreSelect extends MarketEvent {
  final int scoreSelected;
  const MarkerEventScoreSelect({required this.scoreSelected});
}

// Filter : Select Distance
class MarkerEventRangeSelect extends MarketEvent {
  final int rangeSelect;
  const MarkerEventRangeSelect({required this.rangeSelect});
}

// Filter : Select Price
class MarkerEventPriceSelect extends MarketEvent {
  final RangeValues priceRange;
  const MarkerEventPriceSelect({required this.priceRange});
}

// Get Product Items
class MarkerEventGetProductAll extends MarketEvent {}

// Select Menu Product Item
class MarkerEventGetProductDetailMenu extends MarketEvent {
  final int menuIndexSelect;
  const MarkerEventGetProductDetailMenu({required this.menuIndexSelect});
}

class MarkerEventSelectDetailMenu extends MarketEvent {
  final int menuSelectDetail;
  const MarkerEventSelectDetailMenu({required this.menuSelectDetail});
}
