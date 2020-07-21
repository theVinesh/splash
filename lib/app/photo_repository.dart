import 'dart:async';

import 'package:meta/meta.dart';
import 'package:splash/app/unsplash_api_client.dart';

import 'model/photo_model.dart';

class PhotoRepository {
  final UnsplashApiClient unsplashApiClient;

  PhotoRepository({@required this.unsplashApiClient})
      : assert(unsplashApiClient != null);

  Future<List<PhotoModel>> fetchPhotos() async {
    return await unsplashApiClient.fetchPhotos();
  }
}
