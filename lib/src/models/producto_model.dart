

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  String? id;
  String titulo;

  ProductoModel({
    this.id,
    this.titulo = '',

  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"],
        titulo: json["titulo"],

  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "titulo": titulo,

  };
}
