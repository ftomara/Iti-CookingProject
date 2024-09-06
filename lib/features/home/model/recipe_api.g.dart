// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeApi _$RecipeApiFromJson(Map<String, dynamic> json) => RecipeApi(
      (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeApiToJson(RecipeApi instance) => <String, dynamic>{
      'results': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      json['image'] as String?,
      json['title'] as String?,
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'isFav': instance.isFav,
      'image': instance.image,
      'title': instance.title,
      'id': instance.id,
    };
