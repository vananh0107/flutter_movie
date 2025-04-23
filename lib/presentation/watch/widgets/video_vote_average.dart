import 'package:flutter/material.dart';
class VideoVoteAverage extends StatelessWidget {
  const VideoVoteAverage({
    super.key,
    required this.voteAverage,
  });

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.grey,
        ),
        Text(
          '${voteAverage.toStringAsFixed(1)}',
        ),
      ],
    );
  }
}