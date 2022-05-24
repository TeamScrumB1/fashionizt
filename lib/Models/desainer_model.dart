// To parse this JSON data, do
//
//     final desainer = desainerFromJson(jsonString);

import 'dart:convert';

List<dynamic> desainerFromJson(String str) => List<dynamic>.from(json.decode(str).map((x) => x));

String desainerToJson(List<dynamic> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

class DesainerElement {
  DesainerElement({
    required this.id,
    required this.imgProfil,
    required this.nama,
    required this.bio,
    required this.rating,
    required this.linkWa,
    required this.linkPorto,
    required this.gender,
    required this.jmlhProject,
    required this.idKategori,
    required this.idTarif,
    required this.idPengalaman,
  });

  int id;
  String imgProfil;
  String nama;
  String bio;
  String rating;
  String linkWa;
  String linkPorto;
  String gender;
  String jmlhProject;
  String idKategori;
  String idTarif;
  String idPengalaman;

  factory DesainerElement.fromJson(Map<String, dynamic> json) => DesainerElement(
    id: json["id"],
    imgProfil: json["img_profil"],
    nama: json["nama"],
    bio: json["bio"],
    rating: json["rating"],
    linkWa: json["link_wa"],
    linkPorto: json["link_porto"],
    gender: json["gender"],
    jmlhProject: json["jmlh_project"],
    idKategori: json["id_kategori"],
    idTarif: json["id_tarif"],
    idPengalaman: json["id_pengalaman"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img_profil": imgProfil,
    "nama": nama,
    "bio": bio,
    "rating": rating,
    "link_wa": linkWa,
    "link_porto": linkPorto,
    "gender": gender,
    "jmlh_project": jmlhProject,
    "id_kategori": idKategori,
    "id_tarif": idTarif,
    "id_pengalaman": idPengalaman,
  };
}



