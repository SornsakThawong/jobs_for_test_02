// To parse this JSON data, do
//
//     final departmentModel = departmentModelFromJson(jsonString);

import 'dart:convert';

List<DepartmentModel> departmentModelFromJson(String str) => List<DepartmentModel>.from(json.decode(str).map((x) => DepartmentModel.fromJson(x)));

String departmentModelToJson(List<DepartmentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentModel {
    String? name;
    String? imageUrl;
    String? id;

    DepartmentModel({
        this.name,
        this.imageUrl,
        this.id,
    });

    DepartmentModel copyWith({
        String? name,
        String? imageUrl,
        String? id,
    }) => 
        DepartmentModel(
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
            id: id ?? this.id,
        );

    factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "id": id,
    };
}
