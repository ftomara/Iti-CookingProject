import 'package:json_annotation/json_annotation.dart';
part 'recipe_api.g.dart';

@JsonSerializable()
class RecipeApi {
  @JsonKey(name: "results")
  List<Result>? result = [];

  RecipeApi(this.result);

  factory RecipeApi.fromJson(Map<String, dynamic> json) =>
      _$RecipeApiFromJson(json);
}

@JsonSerializable()
class Result {
  //bool isFav = false;
  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "id")
  int? id;

  var isFav;

  Result(this.image, this.title,this.id);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
