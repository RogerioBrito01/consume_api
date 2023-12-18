import 'package:api2/app/domain/entities/movie.dart';
import 'package:api2/app/domain/usecase/get_popular_movies_usecase.dart';

import '../service/movie_repository.dart';

class IGetPopularMoviesUseCase implements GetPopularMoviesUseCase{
  final MovieRepository movieRepository;

  IGetPopularMoviesUseCase({required this.movieRepository});

  Future<List<Movie>> execute() async {
    try {
       return await movieRepository.getPopularMovies();
    } catch (e) {
      throw "";
    }
   
  }
}
