import 'package:json_annotation/json_annotation.dart';
part 'firebase_exception.g.dart';

@JsonSerializable()
class FirebaseException {
  FirebaseException(this.status, this.message);
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  factory FirebaseException.fromJson(Map<String, dynamic> json) =>
      _$FirebaseExceptionFromJson(json);
}
