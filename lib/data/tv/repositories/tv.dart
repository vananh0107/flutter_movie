import 'package:dartz/dartz.dart';
import 'package:movie/common/helper/mapper/keyword.dart';
import 'package:movie/common/helper/mapper/tv.dart';
import 'package:movie/core/models/keyword.dart';
import 'package:movie/data/tv/source/tv.dart';
import 'package:movie/domain/tv/repositories/tv.dart';
import 'package:movie/service_locator.dart';
class TVRepositoryImpl extends TVRepository{
  @override
  Future<Either> getPopularTV() async{
    var returnedData = await sl<TVService>().getPopularTV();
    return returnedData.fold(
          (error) => Left(error),
          (data) {
        var movies = List.from(data['content']).map((item) => TvMapper.toEntity(item)).toList();
        return Right(movies);
      },
    );  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async{
    var returnedData = await sl<TVService>().getRecommendationTVs(tvId);
    return returnedData.fold(
          (error) => Left(error),
          (data) {
        var tvs = List.from(data['content']).map((tv) => TvMapper.toEntity(tv)).toList();
        return Right(tvs);
      },
    );
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async{
    var returnedData = await sl<TVService>().getSimilarTVs(tvId);
    return returnedData.fold(
          (error) => Left(error),
          (data) {
        var tvs = List.from(data['content']).map((tv) => TvMapper.toEntity(tv)).toList();
        return Right(tvs);
      },
    );
  }

  @override
  Future<Either> getKeywords(int tvId) async{
    var returnedData = await sl<TVService>().getKeywords(tvId);
    return returnedData.fold(
          (error) => Left(error),
          (data) {
        var tvs = List.from(data['content']).map((tv) => KeywordMapper.toEntity(KeywordModel.fromJson(tv))).toList();
        return Right(tvs);
      },
    );
  }
}