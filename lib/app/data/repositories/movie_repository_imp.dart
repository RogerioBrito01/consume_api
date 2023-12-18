

import 'package:api2/app/data/datasorce/movie_remote_data_source.dart';
import 'package:api2/app/data/models/movie_model.dart';
import 'package:api2/app/domain/entities/movie.dart';
import 'package:api2/app/domain/service/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<List<Movie>> getPopularMovies() async {
    final movies = await movieRemoteDataSource.fetchPopularMovies();
    return movies.map((movieModel) => movieToEntity(movieModel)).toList();
  }

  Movie movieToEntity(MovieModel movieModel) {
    return Movie(
      id: movieModel.id,
      title: movieModel.title,
      overview: movieModel.overview,
      posterPath: movieModel.posterPath,
    );
  }
}
