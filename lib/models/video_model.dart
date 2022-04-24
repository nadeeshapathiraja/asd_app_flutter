part of 'objects.dart';

@JsonSerializable()
class VideoModel {
  late String id;
  late String name;
  late String thumbnail;
  late String url;

  VideoModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.url,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
