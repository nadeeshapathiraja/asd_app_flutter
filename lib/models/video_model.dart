part of 'objects.dart';

@JsonSerializable()
class VideoModel {
  late String id;
  late String name;
  late String thumbnailUrl;
  late String videoUrl;

  VideoModel({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
