import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash/app/home/repository/photos_repository.dart';
import 'package:splash/app/unsplash_api_client.dart';

import 'home/ui/home_page.dart';

class App extends StatelessWidget {
  final PhotosRepository _repository = PhotosRepository(
    unsplashApiClient: UnsplashApiClient(
      httpClient: http.Client(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: "Splash",
      home: HomePage(repository: _repository),
    );
  }
}
