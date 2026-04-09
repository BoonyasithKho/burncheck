part of 'market_bloc.dart';

class MarketState extends Equatable {
  final int typeSelected;
  final int agriWasteSelected;
  final int scoreSelected;
  final int rangeSelect;
  final RangeValues priceRange;
  final List<Map<String, dynamic>> productItem;
  final int menuDetailSelect;

  const MarketState({
    required this.typeSelected,
    required this.agriWasteSelected,
    required this.scoreSelected,
    required this.rangeSelect,
    required this.priceRange,
    required this.productItem,
    required this.menuDetailSelect,
  });

  MarketState copyWith({
    int? typeSelected,
    int? agriWasteSelected,
    int? scoreSelected,
    int? rangeSelect,
    RangeValues? priceRange,
    List<Map<String, dynamic>>? productItem,
    int? menuDetailSelect,
  }) {
    return MarketState(
      typeSelected: typeSelected ?? this.typeSelected,
      agriWasteSelected: agriWasteSelected ?? this.agriWasteSelected,
      scoreSelected: scoreSelected ?? this.scoreSelected,
      rangeSelect: rangeSelect ?? this.rangeSelect,
      priceRange: priceRange ?? this.priceRange,
      productItem: productItem ?? this.productItem,
      menuDetailSelect: menuDetailSelect ?? this.menuDetailSelect,
    );
  }

  @override
  List<Object> get props => [
    typeSelected,
    agriWasteSelected,
    scoreSelected,
    rangeSelect,
    priceRange,
    productItem,
    menuDetailSelect,
  ];
}
