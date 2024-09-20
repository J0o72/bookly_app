import 'package:bookly/core/widgets/custom_circular_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.51 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => const Center(
            child: CustomCircularLoading(),
          ),
        ),
      ),
    );

    // return AspectRatio(
    //   aspectRatio: 2.51 / 4,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(
    //         Radius.circular(8),
    //       ),
    //       image: DecorationImage(
    //         image: NetworkImage(imageUrl),
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //   ),
    // );
  }
}
