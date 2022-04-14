part of 'objects.dart';

@JsonSerializable()
class ItemModel {
  late String id;
  late String uid;
  late String categoryId;
  late String name;
  late String img;
  late String audio;

  ItemModel({
    required this.id,
    required this.uid,
    required this.categoryId,
    required this.name,
    required this.img,
    required this.audio,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
