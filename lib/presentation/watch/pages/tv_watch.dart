import 'package:flutter/material.dart';
import 'package:movie/common/widgets/appbar/appbar.dart';
import 'package:movie/domain/movie/entities/movie.dart';
import 'package:movie/domain/tv/entities/tv.dart';
import 'package:movie/presentation/watch/widgets/recommendation_movie.dart';
import 'package:movie/presentation/watch/widgets/recommendation_tv.dart';
import 'package:movie/presentation/watch/widgets/similar_movie.dart';
import 'package:movie/presentation/watch/widgets/similar_tv.dart';
import 'package:movie/presentation/watch/widgets/tv_keyword.dart';
import 'package:movie/presentation/watch/widgets/video_overview.dart';
import 'package:movie/presentation/watch/widgets/video_player.dart';
import 'package:movie/presentation/watch/widgets/video_realease_date.dart';
import 'package:movie/presentation/watch/widgets/video_vote_average.dart';
import 'package:movie/presentation/watch/widgets/viideo_title.dart';

class TVWatchPage extends StatelessWidget{
  final TVEntity tvEntity;
  const TVWatchPage({required this.tvEntity, super.key});

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
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(height: 16),
            TvKeywords(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            const SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(height: 16),
            RecommendationTvs(tvId: tvEntity.id!),
            const SizedBox(height: 16),
            SimilarTVs(tvId: tvEntity.id!)
          ],
        ),
      ),
    );
  }
}