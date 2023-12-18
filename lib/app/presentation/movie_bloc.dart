
import 'package:api2/app/domain/usecase/get_popular_movies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/movie.dart';

class MovieBloc extends Cubit<List<Movie>> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MovieBloc({required this.getPopularMoviesUseCase}) : super([]);

  Future<void> getPopularMovies() async {
    final movies = await getPopularMoviesUseCase.execute();
    emit(movies);
  }
}
