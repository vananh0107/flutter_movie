import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/configs/assets/app_images.dart';
import 'package:movie/presentation/home/bloc/trending_cubit.dart';
import 'package:movie/presentation/home/bloc/trending_state.dart';

class TrendingMovie extends StatelessWidget {
  const TrendingMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrendingCubit()..getTrendingMovies(),
        child: BlocBuilder<TrendingCubit, TrendingState>(
            builder: (context, state) {
              if (state is TrendingMoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator()
                );
              }
              if (state is TrendingMoviesLoaded) {
                return FanCarouselImageSlider.sliderType1(
                    imagesLink: state.movies.map(
                            (item) => AppImages.movieImageBasePath + item.posterPath.toString()
                    ).toList(),
                    isAssets: false,
                    autoPlay: false,
                    sliderHeight: 400,
                    showIndicator: true,
                );
              }
              if (state is FailureToLoadTrendingMovies) {
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