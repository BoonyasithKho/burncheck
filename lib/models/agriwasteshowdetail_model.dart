// To parse this JSON data, do
//
//     final agriWasteShowDetail = agriWasteShowDetailFromJson(jsonString);

import 'dart:convert';

AgriWasteShowDetail agriWasteShowDetailFromJson(String str) =>
    AgriWasteShowDetail.fromJson(json.decode(str));

String agriWasteShowDetailToJson(AgriWasteShowDetail data) =>
    json.encode(data.toJson());

class AgriWasteShowDetail {
  final Data? data;

  AgriWasteShowDetail({this.data});

  factory AgriWasteShowDetail.fromJson(Map<String, dynamic> json) =>
      AgriWasteShowDetail(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"data": data?.toJson()};
}

class Data {
  final int? postId;
  final int? userId;
  final int? type;
  final String? description;
  final int? shippingMethod;
  final String? author;
  final String? phone;
  final dynamic email;
  final String? postcode;
  final String? latitude;
  final String? longitude;
  final dynamic status;
  final dynamic rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? province;
  final String? district;
  final String? subdistrict;
  final String? geom;
  final DateTime? expiresAt;
  final List<Product>? products;
  final User? user;
  final List<dynamic>? ratings;

  Data({
    this.postId,
    this.userId,
    this.type,
    this.description,
    this.shippingMethod,
    this.author,
    this.phone,
    this.email,
    this.postcode,
    this.latitude,
    this.longitude,
    this.status,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.province,
    this.district,
    this.subdistrict,
    this.geom,
    this.expiresAt,
    this.products,
    this.user,
    this.ratings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    postId: json["post_id"],
    userId: json["user_id"],
    type: json["type"],
    description: json["description"],
    shippingMethod: json["shipping_method"],
    author: json["author"],
    phone: json["phone"],
    email: json["email"],
    postcode: json["postcode"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    rating: json["rating"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    province: json["province"],
    district: json["district"],
    subdistrict: json["subdistrict"],
    geom: json["geom"],
    expiresAt: json["expires_at"] == null
        ? null
        : DateTime.parse(json["expires_at"]),
    products: json["products"] == null
        ? []
        : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    ratings: json["ratings"] == null
        ? []
        : List<dynamic>.from(json["ratings"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "user_id": userId,
    "type": type,
    "description": description,
    "shipping_method": shippingMethod,
    "author": author,
    "phone": phone,
    "email": email,
    "postcode": postcode,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "rating": rating,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "province": province,
    "district": district,
    "subdistrict": subdistrict,
    "geom": geom,
    "expires_at": expiresAt?.toIso8601String(),
    "products": products == null
        ? []
        : List<dynamic>.from(products!.map((x) => x.toJson())),
    "user": user?.toJson(),
    "ratings": ratings == null
        ? []
        : List<dynamic>.from(ratings!.map((x) => x)),
  };
}

class Product {
  final int? productId;
  final int? productTypeId;
  final int? amount;
  final int? price;
  final String? unit;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? postId;
  final int? balance;
  final ProductType? productType;
  final List<ProductImage>? productImages;

  Product({
    this.productId,
    this.productTypeId,
    this.amount,
    this.price,
    this.unit,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.postId,
    this.balance,
    this.productType,
    this.productImages,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productTypeId: json["product_type_id"],
    amount: json["amount"],
    price: json["price"],
    unit: json["unit"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    postId: json["post_id"],
    balance: json["balance"],
    productType: json["product_type"] == null
        ? null
        : ProductType.fromJson(json["product_type"]),
    productImages: json["product_images"] == null
        ? []
        : List<ProductImage>.from(
            json["product_images"]!.map((x) => ProductImage.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_type_id": productTypeId,
    "amount": amount,
    "price": price,
    "unit": unit,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "post_id": postId,
    "balance": balance,
    "product_type": productType?.toJson(),
    "product_images": productImages == null
        ? []
        : List<dynamic>.from(productImages!.map((x) => x.toJson())),
  };
}

class ProductImage {
  final int? productImageId;
  final int? productId;
  final String? thumbnail;
  final String? full;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  ProductImage({
    this.productImageId,
    this.productId,
    this.thumbnail,
    this.full,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    productImageId: json["product_image_id"],
    productId: json["product_id"],
    thumbnail: json["thumbnail"],
    full: json["full"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "product_image_id": productImageId,
    "product_id": productId,
    "thumbnail": thumbnail,
    "full": full,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class ProductType {
  final int? productTypeId;
  final String? name;
  final String? price;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  ProductType({
    this.productTypeId,
    this.name,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
    productTypeId: json["product_type_id"],
    name: json["name"],
    price: json["price"],
    status: json["status"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "product_type_id": productTypeId,
    "name": name,
    "price": price,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class User {
  final int? userId;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? subdistrict;
  final String? district;
  final String? province;
  final dynamic fcmToken;
  final String? cardId;
  final int? role;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? phone;

  User({
    this.userId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.subdistrict,
    this.district,
    this.province,
    this.fcmToken,
    this.cardId,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    subdistrict: json["subdistrict"],
    district: json["district"],
    province: json["province"],
    fcmToken: json["fcm_token"],
    cardId: json["card_id"],
    role: json["role"],
    status: json["status"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "subdistrict": subdistrict,
    "district": district,
    "province": province,
    "fcm_token": fcmToken,
    "card_id": cardId,
    "role": role,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "phone": phone,
  };
}
