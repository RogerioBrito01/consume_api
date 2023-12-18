import 'package:api2/app/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> fetchPopularMovies();
}