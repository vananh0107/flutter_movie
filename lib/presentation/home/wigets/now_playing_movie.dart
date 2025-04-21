import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/widgets/movie/movie_card.dart';
import 'package:movie/presentation/home/bloc/now_playing_cubit.dart';
import 'package:movie/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
            if (state is NowPlayingMoviesLoading) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is NowPlayingMoviesLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.movies[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 16),
                    itemCount: state.movies.length)
              );
            }
            if (state is FailureToLoadNowPlayingMovies) {
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