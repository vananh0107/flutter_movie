import 'package:movie/data/tv/models/tv.dart';
import 'package:movie/domain/tv/entities/tv.dart';

class TvMapper {
  static TVEntity toEntity(TVModel tvmodel){
    return TVEntity(
      backdropPath: tvmodel.backdropPath,
      id: tvmodel.id,
      name: tvmodel.name,
      originalName: tvmodel.originalName,
      overview: tvmodel.overview,
      posterPath: tvmodel.posterPath,
      mediaType: tvmodel.mediaType,
      adult: tvmodel.adult,
      originalLanguage: tvmodel.originalLanguage,
      genreIds: tvmodel.genreIds,
      popularity: tvmodel.popularity,
      firstAirDate: tvmodel.firstAirDate,
      voteAverage: tvmodel.voteAverage,
      voteCount: tvmodel.voteCount,
      originCountry: tvmodel.originCountry,
    );
  }
}