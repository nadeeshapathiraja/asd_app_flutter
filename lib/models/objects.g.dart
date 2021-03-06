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

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'url': instance.url,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as String,
      uid: json['uid'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'img': instance.img,
    };

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String,
      uid: json['uid'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
      audio: json['audio'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'img': instance.img,
      'audio': instance.audio,
    };
