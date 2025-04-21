import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/widgets/movie/movie_card.dart';
import 'package:movie/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie/presentation/home/bloc/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getPopularTV(),
      child: BlocBuilder<PopularTVCubit, PopularTvState>(
          builder: (context, state) {
            if (state is PopularTVLoading) {
              return const Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is PopularTVLoaded) {
              return SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return MovieCard(movieEntity: state.tv[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 16),
                      itemCount: state.tv.length)
              );
            }
            if (state is FailurePopularTV) {
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