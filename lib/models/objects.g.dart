// GENERATED CODE - DO NOT MODIFY BY HAND

part of objects;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String?,
      age: json['age'] as String?,
      asd_level: json['asd_level'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'age': instance.age,
      'asd_level': instance.asd_level,
    };