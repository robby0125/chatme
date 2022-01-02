// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      fullName: json['fullName'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      profilePictUrl: json['profilePictUrl'] as String,
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'userName': instance.userName,
      'email': instance.email,
      'profilePictUrl': instance.profilePictUrl,
      'isOnline': instance.isOnline,
    };
