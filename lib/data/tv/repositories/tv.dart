import 'package:dartz/dartz.dart';
import 'package:movie/common/helper/mapper/tv_mapper.dart';
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
}