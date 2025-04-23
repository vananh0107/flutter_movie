import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/bloc/generic_data_cubit.dart';
import 'package:movie/common/bloc/generic_data_state.dart';
import 'package:movie/common/widgets/movie/movie_card.dart';
import 'package:movie/domain/movie/entities/movie.dart';
import 'package:movie/domain/movie/usercases/get_recommendation_movie.dart';
import 'package:movie/service_locator.dart';
class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({required this.movieId,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<MovieEntity>>(sl<GetRecommendationMovieUseCase>(), params: movieId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is DataLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommendation Movies',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return MovieCard(movieEntity: state.data[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 16),
                      itemCount: state.data.length)
                 )
                ],
              );
            }
            if (state is FailureLoadData) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          }
      ),
    );
  }
}