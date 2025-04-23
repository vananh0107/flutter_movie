import 'package:flutter/material.dart';
import 'package:movie/common/widgets/appbar/appbar.dart';
import 'package:movie/domain/movie/entities/movie.dart';
import 'package:movie/presentation/watch/widgets/recommendation_movie.dart';
import 'package:movie/presentation/watch/widgets/similar_movie.dart';
import 'package:movie/presentation/watch/widgets/video_overview.dart';
import 'package:movie/presentation/watch/widgets/video_player.dart';
import 'package:movie/presentation/watch/widgets/video_realease_date.dart';
import 'package:movie/presentation/watch/widgets/video_vote_average.dart';
import 'package:movie/presentation/watch/widgets/viideo_title.dart';

class MovieWatchPage extends StatelessWidget{
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(height: 16),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 16),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(height: 16),
            RecommendationMovies(movieId: movieEntity.id!),
            const SizedBox(height: 16),
            SimilarMovies(movieId: movieEntity.id!)
          ],
        ),
      ),
    );
  }
}