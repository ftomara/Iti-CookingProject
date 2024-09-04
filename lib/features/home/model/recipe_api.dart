import 'package:json_annotation/json_annotation.dart';
part 'recipe_api.g.dart';

@JsonSerializable()
class RecipeApi {
  @JsonKey(name: "hits")
  List<Hit> result = [];

  RecipeApi(this.result);

  factory RecipeApi.fromJson(Map<String, dynamic> json) =>
      _$RecipeApiFromJson(json);
}

@JsonSerializable()
class Hit {
  @JsonKey(name: "recipe")
  Result recipe;

  Hit(this.recipe);

  factory Hit.fromJson(Map<String, dynamic> json) =>
      _$HitFromJson(json);
}

@JsonSerializable()
class Result {
    bool isFav = false;
  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "label")
  String label;

  @JsonKey(name: "ingredientLines")
  List<String> ingredientLines;

  @JsonKey(name: "calories")
  int calories;

  @JsonKey(name: "totalTime")
  int totalTime;

  Result(this.calories, this.image, this.ingredientLines, this.label, this.totalTime);

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);
}
