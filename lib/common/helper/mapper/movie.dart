import 'package:movie/data/movie/models/movie.dart';
import 'package:movie/domain/movie/entities/movie.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel model) {
    return MovieEntity(
      backdropPath: model.backdropPath,
      id: model.id,
      title: model.title,
      originalTitle: model.originalTitle,
      overview: model.overview,
      posterPath: model.posterPath,
      mediaType: model.mediaType,
      adult: model.adult,
      originalLanguage: model.originalLanguage,
      genreIds: List<int>.from(model.genreIds ?? []),
      popularity: model.popularity,
      releaseDate: model.releaseDate,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}