import 'package:flutter_cinemapedia/domain/entities/movie.dart';
import 'package:flutter_cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviebd) => Movie(
      adult: moviebd.adult,
      backdropPath: moviebd.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${moviebd.backdropPath}'
          : 'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      genreIds: moviebd.genreIds.map((e) => e.toString()).toList(),
      id: moviebd.id,
      originalLanguage: moviebd.originalLanguage,
      originalTitle: moviebd.originalTitle,
      overview: moviebd.overview,
      popularity: moviebd.popularity,
      posterPath: moviebd.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${moviebd.posterPath}'
          : 'no-poster',
      releaseDate: moviebd.releaseDate,
      title: moviebd.title,
      video: moviebd.video,
      voteAverage: moviebd.voteAverage,
      voteCount: moviebd.voteCount);
}
