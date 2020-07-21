import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'model/photo_model.dart';

class UnsplashApiClient {
  final _baseUrl = 'api.unsplash.com';
  final _clientId = 'Owz54zcaT46pSKQ7_3FzkDhY48a5U-Puy_uoj4K7__o';
  final http.Client httpClient;

  UnsplashApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<PhotoModel>> fetchPhotos({int count = 10, String query}) async {
    final params = {'count': '$count', 'query': query, 'featured': 'true'};
    params.removeWhere((key, value) => value == null);
    final url = Uri.https(
      _baseUrl,
      '/photos/random',
      params,
    );
    final response = await this.httpClient.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Client-ID $_clientId'},
    );

    if (response.statusCode != 200) {
      throw new Exception('error ${response.statusCode}: ${response.body}');
    }

    final responseJson = jsonDecode(response.body);
    final list = List.of(responseJson);
    return list.map((item) => PhotoModel.fromJson(item)).toList();
  }
}
