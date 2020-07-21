import 'package:equatable/equatable.dart';

class PhotoModel extends Equatable {
  final String id;
  final int width;
  final int height;
  final String colorCode;
  final String description;
  final String url;

  const PhotoModel({
    this.id,
    this.width,
    this.height,
    this.colorCode,
    this.description,
    this.url,
  });

  factory PhotoModel.fromJson(dynamic json) {
    return PhotoModel(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      colorCode: json['color'],
      description: json['description'],
      url: json['urls']['regular'],
    );
  }

  @override
  List<Object> get props => [id, url];
}
