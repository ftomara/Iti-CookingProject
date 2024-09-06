// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeInfo _$RecipeInfoFromJson(Map<String, dynamic> json) => RecipeInfo(
      (json['extendedIngredients'] as List<dynamic>?)
          ?.map((e) => ExtendedIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['analyzedInstructions'] as List<dynamic>?)
          ?.map((e) => AnalyzedInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['image'] as String?,
      (json['readyInMinutes'] as num?)?.toInt(),
      (json['servings'] as num?)?.toInt(),
      json['title'] as String?,
    );

Map<String, dynamic> _$RecipeInfoToJson(RecipeInfo instance) =>
    <String, dynamic>{
      'extendedIngredients': instance.extendedIngredients,
      'analyzedInstructions': instance.analyzedInstructions,
      'title': instance.title,
      'servings': instance.servings,
      'readyInMinutes': instance.readyInMinutes,
      'image': instance.image,
    };

ExtendedIngredient _$ExtendedIngredientFromJson(Map<String, dynamic> json) =>
    ExtendedIngredient(
      json['name'] as String?,
      (json['amount'] as num?)?.toDouble(),
      json['unit'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ExtendedIngredientToJson(ExtendedIngredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
      'image': instance.image,
    };

AnalyzedInstruction _$AnalyzedInstructionFromJson(Map<String, dynamic> json) =>
    AnalyzedInstruction(
      (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnalyzedInstructionToJson(
        AnalyzedInstruction instance) =>
    <String, dynamic>{
      'steps': instance.steps,
    };

Step _$StepFromJson(Map<String, dynamic> json) => Step(
      (json['number'] as num?)?.toInt(),
      json['step'] as String?,
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['equipment'] as List<dynamic>?)
          ?.map((e) => Equipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'number': instance.number,
      'step': instance.step,
      'ingredients': instance.ingredients,
      'equipment': instance.equipment,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      json['name'] as String?,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) =>
    <String, dynamic>{'name': instance.name, 'image': instance.image};
