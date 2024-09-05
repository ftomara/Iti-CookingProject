// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeInfo _$RecipeInfoFromJson(Map<String, dynamic> json) => RecipeInfo(
      (json['extendedIngredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['instructions'] as String?,
    );

Map<String, dynamic> _$RecipeInfoToJson(RecipeInfo instance) =>
    <String, dynamic>{
      'extendedIngredients': instance.extendedIngredients,
      'instructions': instance.instructions,
    };
