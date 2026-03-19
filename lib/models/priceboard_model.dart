// To parse this JSON data, do
//
//     final priceBoard = priceBoardFromJson(jsonString);

import 'dart:convert';

List<PriceBoard> priceBoardFromJson(String str) =>
    List<PriceBoard>.from(json.decode(str).map((x) => PriceBoard.fromJson(x)));

String priceBoardToJson(List<PriceBoard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PriceBoard {
  final int productTypeId;
  final String name;
  final String min;
  final String avg;
  final String max;

  PriceBoard({
    required this.productTypeId,
    required this.name,
    required this.min,
    required this.avg,
    required this.max,
  });

  PriceBoard copyWith({
    int? productTypeId,
    String? name,
    String? min,
    String? avg,
    String? max,
  }) => PriceBoard(
    productTypeId: productTypeId ?? this.productTypeId,
    name: name ?? this.name,
    min: min ?? this.min,
    avg: avg ?? this.avg,
    max: max ?? this.max,
  );

  factory PriceBoard.fromJson(Map<String, dynamic> json) => PriceBoard(
    productTypeId: json["product_type_id"],
    name: json["name"],
    min: json["min"],
    avg: json["avg"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "product_type_id": productTypeId,
    "name": name,
    "min": min,
    "avg": avg,
    "max": max,
  };
}
