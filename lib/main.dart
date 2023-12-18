import 'package:api2/app/data/core/api_config.dart';
import 'package:api2/app/data/datasorce/move_remote_data_source_imp.dart';
import 'package:api2/app/data/datasorce/movie_remote_data_source.dart';
import 'package:api2/app/domain/usecase/get_popular_movies_usecase.dart';
import 'package:api2/app/domain/usecase/product_usecase_imp.dart';
import 'package:api2/app/presentation/movie_bloc.dart';
import 'package:api2/app/presentation/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'app/data/repositories/movie_repository_imp.dart';

void main() {
  final http.Client client = http.Client();
  final String baseUrl = ApiConfig.baseUrl;

  final MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSourceImpl(
    client: client,
    baseUrl: baseUrl,
  );

  final MovieRepositoryImpl movieRepository = MovieRepositoryImpl(
    movieRemoteDataSource: movieRemoteDataSource,
  );

  final IGetPopularMoviesUseCase getPopularMoviesUseCase = IGetPopularMoviesUseCase(
    movieRepository: movieRepository,
  );

  final MovieBloc movieBloc = MovieBloc(
    getPopularMoviesUseCase: getPopularMoviesUseCase,
  );

  runApp(MyApp(movieBloc: movieBloc));
}

class MyApp extends StatelessWidget {
  final MovieBloc movieBloc;

  MyApp({required this.movieBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieScreen(movieBloc: movieBloc),
    );
  }
}
