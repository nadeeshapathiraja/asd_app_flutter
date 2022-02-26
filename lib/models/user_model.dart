part of 'objects.dart';

@JsonSerializable()
class UserModel {
  late String uid;
  late String email;
  late String phone;
  late String? username;
  late String? age;
  late String? asd_level;

  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    this.username,
    this.age,
    this.asd_level,
  });

  // UserModel.fromMap(Map map) {
  //   uid = map['uid'];
  //   email = map['email'];
  //   phone = map['phone'];
  // }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
