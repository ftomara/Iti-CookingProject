// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseException _$FirebaseExceptionFromJson(Map<String, dynamic> json) =>
    FirebaseException(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$FirebaseExceptionToJson(FirebaseException instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };