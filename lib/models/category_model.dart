part of 'objects.dart';

@JsonSerializable()
class CategoryModel {
  late String id;
  late String uid;
  late String name;
  late String img;

  CategoryModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.img,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
