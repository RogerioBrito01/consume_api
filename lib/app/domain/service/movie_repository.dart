

import 'package:api2/app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
}
