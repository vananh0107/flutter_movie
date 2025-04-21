import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/common/widgets/appbar/appbar.dart';
import 'package:movie/core/configs/assets/app_vectors.dart';
import 'package:movie/presentation/home/wigets/category_text.dart';
import 'package:movie/presentation/home/wigets/now_playing_movie.dart';
import 'package:movie/presentation/home/wigets/popular_tv.dart';
import 'package:movie/presentation/home/wigets/trending_movie.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
                AppVectors.logo
            ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryText(title: "Trending"),
            TrendingMovie(),
            SizedBox(height: 16),
            CategoryText(title: "Now Playing"),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            CategoryText(title: "Popular TV"),
            SizedBox(height: 16),
            PopularTv(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
