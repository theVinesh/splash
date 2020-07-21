import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash/app/app.dart';
import 'package:splash/app/photo_repository.dart';
import 'package:splash/app/unsplash_api_client.dart';

void main() {
  final UnsplashApiClient _client =
      UnsplashApiClient(httpClient: http.Client());
  PhotoRepository _repository = PhotoRepository(unsplashApiClient: _client);

  runApp(App(repository: _repository));
}
