import 'package:api2/app/domain/entities/movie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_bloc.dart';

class MovieScreen extends StatelessWidget {
  final MovieBloc movieBloc;

  MovieScreen({required this.movieBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
      ),
      body: BlocProvider(
        create: (context) => movieBloc,
        child: BlocBuilder<MovieBloc, List<Movie>>(
          builder: (context, movies) {
            if (movies.isNotEmpty) {
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(movies[index].title),
                    subtitle: Text(movies[index].overview),
                    leading: Image.network(
                      'https://image.tmdb.org/t/p/w92${movies[index].posterPath}',
                      width: 50,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          movieBloc.getPopularMovies();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
