// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

Produk produkFromJson(String str) => Produk.fromJson(json.decode(str));

String produkToJson(Produk data) => json.encode(data.toJson());

class Produk {
  Produk({
    required this.status,
    required this.totalResults,
    required this.produk,
  });

  String status;
  int totalResults;
  List<ProdukElement> produk;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    status: json["status"],
    totalResults: json["totalResults"],
    produk: List<ProdukElement>.from(json["produk"].map((x) => ProdukElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "produk": List<dynamic>.from(produk.map((x) => x.toJson())),
  };
}

class ProdukElement {
  ProdukElement({
    required this.id,
    required this.nama,
    required this.imgProduk,
    required this.harga,
    required this.rating,
    required this.deskripsi,
    required this.namaDesainer,
    required this.namaKonveksi,
  });

  String id;
  String nama;
  String imgProduk;
  String harga;
  String rating;
  String deskripsi;
  String namaDesainer;
  String namaKonveksi;

  factory ProdukElement.fromJson(Map<String, dynamic> json) => ProdukElement(
    id: json["id"],
    nama: json["nama"],
    imgProduk: json["img_produk"],
    harga: json["harga"],
    rating: json["rating"],
    deskripsi: json["deskripsi"],
    namaDesainer: json["nama_desainer"],
    namaKonveksi: json["nama_konveksi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "img_produk": imgProduk,
    "harga": harga,
    "rating": rating,
    "deskripsi": deskripsi,
    "nama_desainer": namaDesainer,
    "nama_konveksi": namaKonveksi,
  };
}