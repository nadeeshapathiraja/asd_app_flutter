class UserModel {
  late String uid;
  late String email;
  late String phone;

  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
  });

  UserModel.fromMap(Map map) {
    uid = map['uid'];
    email = map['email'];
    phone = map['phone'];
  }
}
