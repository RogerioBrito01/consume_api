import 'package:api2/app/domain/entities/movie.dart';

abstract class GetPopularMoviesUseCase{
  Future<List<Movie>> execute();
}