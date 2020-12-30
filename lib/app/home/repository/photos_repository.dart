import 'dart:async';

import 'package:meta/meta.dart';
import 'package:splash/app/model/photo_model.dart';
import 'package:splash/app/unsplash_api_client.dart';


class PhotosRepository {
  final UnsplashApiClient unsplashApiClient;

  PhotosRepository({@required this.unsplashApiClient})
      : assert(unsplashApiClient != null);

  Future<List<PhotoModel>> fetchPhotos() async {
    return await unsplashApiClient.fetchPhotos();
  }
}
