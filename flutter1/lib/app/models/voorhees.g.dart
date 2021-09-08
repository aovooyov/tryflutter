// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voorhees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voorhees _$VoorheesFromJson(Map<String, dynamic> json) {
  return Voorhees(
    id: json['id'] as int,
    link: json['link'] as String,
    name: json['name'] as String,
    descr: json['descr'] as String,
    image: json['image'] as String,
    backdrop: json['backdrop'] as String,
    parts: (json['parts'] as List)
        ?.map(
            (e) => e == null ? null : Part.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    count: json['count'] as int,
    likeCount: json['likeCount'] as int,
  );
}

Map<String, dynamic> _$VoorheesToJson(Voorhees instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'descr': instance.descr,
      'image': instance.image,
      'backdrop': instance.backdrop,
      'parts': instance.parts,
      'count': instance.count,
      'likeCount': instance.likeCount,
    };

Part _$PartFromJson(Map<String, dynamic> json) {
  return Part(
    id: json['id'] as int,
    link: json['link'] as String,
    name: json['name'] as String,
    poster: json['poster'] as String,
    posterTmdb: json['posterTmdb'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    quality: json['quality'] as String,
    extra: json['extra'] as String,
  );
}

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'poster': instance.poster,
      'posterTmdb': instance.posterTmdb,
      'rating': instance.rating,
      'tags': instance.tags,
      'quality': instance.quality,
      'extra': instance.extra,
    };
