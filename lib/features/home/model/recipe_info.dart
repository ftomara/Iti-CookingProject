import 'package:json_annotation/json_annotation.dart';
part 'recipe_info.g.dart';

@JsonSerializable()
class RecipeInfo {
  @JsonKey(name: "extendedIngredients")
  List<String>? extendedIngredients;

  @JsonKey(name: "instructions")
  String ?instructions;

  RecipeInfo(this.extendedIngredients, this.instructions);
  factory RecipeInfo.fromJson(Map<String, dynamic> json) =>
      _$RecipeInfoFromJson(json);
}
