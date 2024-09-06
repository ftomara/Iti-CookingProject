// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeApi _$RecipeApiFromJson(Map<String, dynamic> json) => RecipeApi(
      (json['hits'] as List<dynamic>)
          .map((e) => Hit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeApiToJson(RecipeApi instance) => <String, dynamic>{
      'hits': instance.result,
    };

Hit _$HitFromJson(Map<String, dynamic> json) => Hit(
      Result.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HitToJson(Hit instance) => <String, dynamic>{
      'recipe': instance.recipe,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      (json['calories'] as num).toInt(),
      json['image'] as String,
      (json['ingredientLines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      json['label'] as String,
      (json['totalTime'] as num).toInt(),);
    // )..isFav = json['isFav'] as bool;

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'isFav': instance.isFav,
      'image': instance.image,
      'label': instance.label,
      'ingredientLines': instance.ingredientLines,
      'calories': instance.calories,
      'totalTime': instance.totalTime,
    };
