part of 'market_bloc.dart';

class MarketState extends Equatable {
  final int typeSelected;
  final int agriWasteSelected;
  final int scoreSelected;
  final int rangeSelect;
  final RangeValues priceRange;
  final List<Map<String, dynamic>> productItem;
  final Map<String, dynamic> menuDetailSelect;
  final int markerMenuSelect;

  const MarketState({
    required this.typeSelected,
    required this.agriWasteSelected,
    required this.scoreSelected,
    required this.rangeSelect,
    required this.priceRange,
    required this.productItem,
    required this.menuDetailSelect,
    required this.markerMenuSelect,
  });

  MarketState copyWith({
    int? typeSelected,
    int? agriWasteSelected,
    int? scoreSelected,
    int? rangeSelect,
    RangeValues? priceRange,
    List<Map<String, dynamic>>? productItem,
    Map<String, dynamic>? menuDetailSelect,
    int? markerMenuSelect,
  }) {
    return MarketState(
      typeSelected: typeSelected ?? this.typeSelected,
      agriWasteSelected: agriWasteSelected ?? this.agriWasteSelected,
      scoreSelected: scoreSelected ?? this.scoreSelected,
      rangeSelect: rangeSelect ?? this.rangeSelect,
      priceRange: priceRange ?? this.priceRange,
      productItem: productItem ?? this.productItem,
      menuDetailSelect: menuDetailSelect ?? this.menuDetailSelect,
      markerMenuSelect: markerMenuSelect ?? this.markerMenuSelect,
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
    markerMenuSelect,
  ];
}
