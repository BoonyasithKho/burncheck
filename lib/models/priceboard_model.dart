// To parse this JSON data, do
//
//     final priceBoardModel = priceBoardModelFromJson(jsonString);

import 'dart:convert';

PriceBoardModel priceBoardModelFromJson(String str) =>
    PriceBoardModel.fromJson(json.decode(str));

String priceBoardModelToJson(PriceBoardModel data) =>
    json.encode(data.toJson());

class PriceBoardModel {
  List<Datum> data;

  PriceBoardModel({required this.data});

  PriceBoardModel copyWith({List<Datum>? data}) =>
      PriceBoardModel(data: data ?? this.data);

  factory PriceBoardModel.fromJson(Map<String, dynamic> json) =>
      PriceBoardModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String materialName;
  String minPrice;
  String avgPrice;
  String maxPrice;
  int itemValue;

  Datum({
    required this.id,
    required this.materialName,
    required this.minPrice,
    required this.avgPrice,
    required this.maxPrice,
    required this.itemValue,
  });

  Datum copyWith({
    int? id,
    String? materialName,
    String? minPrice,
    String? avgPrice,
    String? maxPrice,
    int? itemValue,
  }) => Datum(
    id: id ?? this.id,
    materialName: materialName ?? this.materialName,
    minPrice: minPrice ?? this.minPrice,
    avgPrice: avgPrice ?? this.avgPrice,
    maxPrice: maxPrice ?? this.maxPrice,
    itemValue: itemValue ?? this.itemValue,
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    materialName: json["material_name"],
    minPrice: json["min_price"],
    avgPrice: json["avg_price"],
    maxPrice: json["max_price"],
    itemValue: json["item_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "material_name": materialName,
    "min_price": minPrice,
    "avg_price": avgPrice,
    "max_price": maxPrice,
    "item_value": itemValue,
  };
}
