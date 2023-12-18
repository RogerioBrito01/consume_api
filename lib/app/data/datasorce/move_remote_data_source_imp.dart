

import 'dart:convert';

import 'package:api2/app/data/models/movie_model.dart';
import 'package:http/http.dart' as http;




import '../core/api_config.dart';
import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  MovieRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<List<MovieModel>> fetchPopularMovies() async {
    final response = await client.get(Uri.parse('$baseUrl/movie/popular?api_key=${ApiConfig.apiKey}'));
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    final List<dynamic> moviesList = jsonResponse['results'] ;
    return moviesList.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
  }
}