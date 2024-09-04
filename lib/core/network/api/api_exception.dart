import 'package:json_annotation/json_annotation.dart';
part 'api_exception.g.dart';

@JsonSerializable()
class ApiException {
  ApiException(this.status, this.message);
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  factory ApiException.fromJson(Map<String, dynamic> json) =>
      _$ApiExceptionFromJson(json);
}
