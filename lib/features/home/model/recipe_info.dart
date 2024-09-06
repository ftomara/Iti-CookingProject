import 'package:json_annotation/json_annotation.dart';

part 'recipe_info.g.dart';

@JsonSerializable()
class RecipeInfo {
  @JsonKey(name: "extendedIngredients")
  List<ExtendedIngredient>? extendedIngredients;

  @JsonKey(name: "analyzedInstructions")
  List<AnalyzedInstruction>? analyzedInstructions;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "servings")
  int? servings;

  @JsonKey(name: "readyInMinutes")
  int? readyInMinutes;

  @JsonKey(name: "image")
  String? image;

  RecipeInfo(this.extendedIngredients, this.analyzedInstructions, this.image,
      this.readyInMinutes, this.servings, this.title);

  factory RecipeInfo.fromJson(Map<String, dynamic> json) =>
      _$RecipeInfoFromJson(json);
}

@JsonSerializable()
class ExtendedIngredient {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "amount")
  double? amount;

  @JsonKey(name: "unit")
  String? unit;

  @JsonKey(name: "image")
  String? image;

  ExtendedIngredient(this.name, this.amount, this.unit, this.image);

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientFromJson(json);
}

@JsonSerializable()
class AnalyzedInstruction {
  @JsonKey(name: "steps")
  List<Step>? steps;

  AnalyzedInstruction(this.steps);

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedInstructionFromJson(json);
}

@JsonSerializable()
class Step {
  @JsonKey(name: "number")
  int? number;

  @JsonKey(name: "step")
  String? step;

  @JsonKey(name: "ingredients")
  List<Ingredient>? ingredients;

  @JsonKey(name: "equipment")
  List<Equipment>? equipment;

  Step(this.number, this.step, this.ingredients, this.equipment);

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}

@JsonSerializable()
class Ingredient {
  @JsonKey(name: "name")
  String? name;

  Ingredient(this.name);

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}

@JsonSerializable()
class Equipment {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "image")
  String? image;

  Equipment(this.name, this.image);

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Equipment && other.name == name && other.image == image;
  }

  // Override hashCode to compute based on name and image
  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}
