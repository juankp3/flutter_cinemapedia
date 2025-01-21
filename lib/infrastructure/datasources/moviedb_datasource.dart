import 'package:dio/dio.dart';
import 'package:flutter_cinemapedia/config/constants/enviroment.dart';
import 'package:flutter_cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:flutter_cinemapedia/domain/entities/movie.dart';
import 'package:flutter_cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDataSource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': 'es-PE',
    },
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviebd) => moviebd.posterPath != 'no-poster')
        .map((moviebd) => MovieMapper.movieDBToEntity(moviebd))
        .toList();

    return movies;
  }
}
