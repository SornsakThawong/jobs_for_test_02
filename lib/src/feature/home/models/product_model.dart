// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    String? name;
    String? imageUrl;
    String? desc;
    String? price;
    Type? type;
    String? id;
    String? departmentId;

    ProductModel({
        this.name,
        this.imageUrl,
        this.desc,
        this.price,
        this.type,
        this.id,
        this.departmentId,
    });

    ProductModel copyWith({
        String? name,
        String? imageUrl,
        String? desc,
        String? price,
        Type? type,
        String? id,
        String? departmentId,
    }) => 
        ProductModel(
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
            desc: desc ?? this.desc,
            price: price ?? this.price,
            type: type ?? this.type,
            id: id ?? this.id,
            departmentId: departmentId ?? this.departmentId,
        );

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        desc: json["desc"],
        price: json["price"],
        type: typeValues.map[json["type"]]!,
        id: json["id"],
        departmentId: json["departmentId"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "desc": desc,
        "price": price,
        "type": typeValues.reverse[type],
        "id": id,
        "departmentId": departmentId,
    };
}

enum Type {
    // ignore: constant_identifier_names
    NORMAL,
    SPACIAL
}

final typeValues = EnumValues({
    "normal": Type.NORMAL,
    "spacial": Type.SPACIAL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
