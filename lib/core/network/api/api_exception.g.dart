// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiException _$ApiExceptionFromJson(Map<String, dynamic> json) => ApiException(
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$ApiExceptionToJson(ApiException instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
