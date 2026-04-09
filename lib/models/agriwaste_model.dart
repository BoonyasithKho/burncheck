// To parse this JSON data, do
//
//     final agriWasteModel = agriWasteModelFromJson(jsonString);

import 'dart:convert';

AgriWasteModel agriWasteModelFromJson(String str) =>
    AgriWasteModel.fromJson(json.decode(str));

String agriWasteModelToJson(AgriWasteModel data) => json.encode(data.toJson());

class AgriWasteModel {
  int recordsTotal;
  int recordsFiltered;
  List<Datum> data;
  int page;
  int start;
  int length;

  AgriWasteModel({
    required this.recordsTotal,
    required this.recordsFiltered,
    required this.data,
    required this.page,
    required this.start,
    required this.length,
  });

  AgriWasteModel copyWith({
    int? recordsTotal,
    int? recordsFiltered,
    List<Datum>? data,
    int? page,
    int? start,
    int? length,
  }) => AgriWasteModel(
    recordsTotal: recordsTotal ?? this.recordsTotal,
    recordsFiltered: recordsFiltered ?? this.recordsFiltered,
    data: data ?? this.data,
    page: page ?? this.page,
    start: start ?? this.start,
    length: length ?? this.length,
  );

  factory AgriWasteModel.fromJson(Map<String, dynamic> json) => AgriWasteModel(
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    page: json["page"],
    start: json["start"],
    length: json["length"],
  );

  Map<String, dynamic> toJson() => {
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "page": page,
    "start": start,
    "length": length,
  };
}

class Datum {
  int postId;
  int productId;
  String author;
  String description;
  Type type;
  Type productType;
  List<ProductImage>? productImages;
  int amount;
  int balance;
  String price;
  Unit unit;
  Address address;
  dynamic rating;
  User user;
  DateTime createdAt;
  DateTime expiresAt;

  Datum({
    required this.postId,
    required this.productId,
    required this.author,
    required this.description,
    required this.type,
    required this.productType,
    this.productImages,
    required this.amount,
    required this.balance,
    required this.price,
    required this.unit,
    required this.address,
    required this.rating,
    required this.user,
    required this.createdAt,
    required this.expiresAt,
  });

  Datum copyWith({
    int? postId,
    int? productId,
    String? author,
    String? description,
    Type? type,
    Type? productType,
    List<ProductImage>? productImages,
    int? amount,
    int? balance,
    String? price,
    Unit? unit,
    Address? address,
    dynamic rating,
    User? user,
    DateTime? createdAt,
    DateTime? expiresAt,
  }) => Datum(
    postId: postId ?? this.postId,
    productId: productId ?? this.productId,
    author: author ?? this.author,
    description: description ?? this.description,
    type: type ?? this.type,
    productType: productType ?? this.productType,
    productImages: productImages ?? this.productImages,
    amount: amount ?? this.amount,
    balance: balance ?? this.balance,
    price: price ?? this.price,
    unit: unit ?? this.unit,
    address: address ?? this.address,
    rating: rating ?? this.rating,
    user: user ?? this.user,
    createdAt: createdAt ?? this.createdAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    postId: json["post_id"],
    productId: json["product_id"],
    author: json["author"],
    description: json["description"],
    type: Type.fromJson(json["type"]),
    productType: Type.fromJson(json["product_type"]),
    productImages: List<ProductImage>.from(
      json["product_images"].map((x) => ProductImage.fromJson(x)),
    ),
    amount: json["amount"],
    balance: json["balance"],
    price: json["price"],
    unit: unitValues.map[json["unit"]]!,
    address: Address.fromJson(json["address"]),
    rating: json["rating"],
    user: User.fromJson(json["user"]),
    createdAt: DateTime.parse(json["created_at"]),
    expiresAt: DateTime.parse(json["expires_at"]),
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "product_id": productId,
    "author": author,
    "description": description,
    "type": type.toJson(),
    "product_type": productType.toJson(),
    "product_images": List<dynamic>.from(productImages!.map((x) => x.toJson())),
    "amount": amount,
    "balance": balance,
    "price": price,
    "unit": unitValues.reverse[unit],
    "address": address.toJson(),
    "rating": rating,
    "user": user.toJson(),
    "created_at": createdAt.toIso8601String(),
    "expires_at": expiresAt.toIso8601String(),
  };
}

class Address {
  String province;
  String district;
  String subdistrict;
  String text;

  Address({
    required this.province,
    required this.district,
    required this.subdistrict,
    required this.text,
  });

  Address copyWith({
    String? province,
    String? district,
    String? subdistrict,
    String? text,
  }) => Address(
    province: province ?? this.province,
    district: district ?? this.district,
    subdistrict: subdistrict ?? this.subdistrict,
    text: text ?? this.text,
  );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    province: json["province"],
    district: json["district"],
    subdistrict: json["subdistrict"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "province": province,
    "district": district,
    "subdistrict": subdistrict,
    "text": text,
  };
}

class ProductImage {
  int productImageId;
  int productId;
  String thumbnail;
  String full;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  ProductImage({
    required this.productImageId,
    required this.productId,
    required this.thumbnail,
    required this.full,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  ProductImage copyWith({
    int? productImageId,
    int? productId,
    String? thumbnail,
    String? full,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) => ProductImage(
    productImageId: productImageId ?? this.productImageId,
    productId: productId ?? this.productId,
    thumbnail: thumbnail ?? this.thumbnail,
    full: full ?? this.full,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt ?? this.deletedAt,
  );

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    productImageId: json["product_image_id"],
    productId: json["product_id"],
    thumbnail: json["thumbnail"],
    full: json["full"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "product_image_id": productImageId,
    "product_id": productId,
    "thumbnail": thumbnail,
    "full": full,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class Type {
  int id;
  String text;

  Type({required this.id, required this.text});

  Type copyWith({int? id, String? text}) =>
      Type(id: id ?? this.id, text: text ?? this.text);

  factory Type.fromJson(Map<String, dynamic> json) =>
      Type(id: json["id"], text: json["text"]);

  Map<String, dynamic> toJson() => {"id": id, "text": text};
}

enum Unit { KG }

final unitValues = EnumValues({"kg": Unit.KG});

class User {
  int userId;
  String name;

  User({required this.userId, required this.name});

  User copyWith({int? userId, String? name}) =>
      User(userId: userId ?? this.userId, name: name ?? this.name);

  factory User.fromJson(Map<String, dynamic> json) =>
      User(userId: json["user_id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"user_id": userId, "name": name};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
