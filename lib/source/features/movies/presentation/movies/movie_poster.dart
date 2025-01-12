import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/source/features/movies/domain/tmdb_poster.dart';
import 'package:shimmer/shimmer.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, this.imagePath});
  final String? imagePath;

  static const width = 154.0;
  static const height = 231.0;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return CachedNetworkImage(
        //fit: BoxFit.fitWidth,
        imageUrl: TMDBPoster.imageUrl(imagePath!, PosterSize.w154),
        placeholder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black12,
          child: Container(
            width: width,
            height: height,
            color: Colors.black,
          ),
        ),
      );
    }
    return const Placeholder(
      color: Colors.black87,
    );
  }
}

class TopGradient extends StatelessWidget {
  const TopGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black87,
            Colors.transparent,
          ],
          stops: [0.1, 0.5],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.repeated,
        ),
      ),
    );
  }
}
