import 'package:json_annotation/json_annotation.dart';

part 'voorhees.g.dart';

@JsonSerializable()
class Voorhees {
  final int id;
  final String link;
  final String name;
  final String descr;
  final String image;
  final String backdrop;
  final List<Part> parts;
  final int count;
  final int likeCount;

  Voorhees(
      {this.id,
      this.link,
      this.name,
      this.descr,
      this.image,
      this.backdrop,
      this.parts,
      this.count,
      this.likeCount});

  factory Voorhees.fromJson(Map<String, dynamic> json) =>
      _$VoorheesFromJson(json);

  Map<String, dynamic> toJson() => _$VoorheesToJson(this);

  // factory Voorhees.fromJson(Map<String, dynamic> json) {
  //   return Voorhees(
  //     id: json['id'],
  //     link: json['link'],
  //     name: json['name'],
  //     descr: json['descr'],
  //     image: json['image'],
  //     backdrop: json['backdrop'],
  //     parts: json['parts'].map((v) {
  //       return new Part.fromJson(v);
  //     }),
  //     count: json['count'],
  //     likeCount: json['like_count'],
  //   );
  // }
}

@JsonSerializable()
class Part {
  final int id;
  final String link;
  final String name;
  final String poster;
  final String posterTmdb;
  final double rating;
  final List<String> tags;
  final String quality;
  final String extra;

  Part(
      {this.id,
      this.link,
      this.name,
      this.poster,
      this.posterTmdb,
      this.rating,
      this.tags,
      this.quality,
      this.extra});

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);

  // factory Part.fromJson(Map<String, dynamic> json) {
  //   return Part(
  //     id: json['id'],
  //     link: json['link'],
  //     name: json['name'],
  //     poster: json['poster'],
  //     posterTmdb: json['posterTmdb'],
  //     rating: json['rating'],
  //     tags: json['tags'].cast<String>(),
  //     quality: json['quality'],
  //     extra: json['extra'],
  //   );
  // }
}
