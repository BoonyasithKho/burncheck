part of 'market_bloc.dart';

class MarketState extends Equatable {
  final int typeSelected;
  final int agriWasteSelected;
  final int scoreSelected;
  final int rangeSelect;
  final RangeValues priceRange;

  const MarketState({
    required this.typeSelected,
    required this.agriWasteSelected,
    required this.scoreSelected,
    required this.rangeSelect,
    required this.priceRange,
  });

  MarketState copyWith({
    int? typeSelected,
    int? agriWasteSelected,
    int? scoreSelected,
    int? rangeSelect,
    RangeValues? priceRange,
  }) {
    return MarketState(
      typeSelected: typeSelected ?? this.typeSelected,
      agriWasteSelected: agriWasteSelected ?? this.agriWasteSelected,
      scoreSelected: scoreSelected ?? this.scoreSelected,
      rangeSelect: rangeSelect ?? this.rangeSelect,
      priceRange: priceRange ?? this.priceRange,
    );
  }

  @override
  List<Object> get props => [
    typeSelected,
    agriWasteSelected,
    scoreSelected,
    rangeSelect,
    priceRange,
  ];
}
