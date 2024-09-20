import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  // final BookModel bookModel;
  final num rating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          // bookModel.volumeInfo.averageRating?.round().toString() ??0.toString()
          rating.toString(),
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            // "(${bookModel.volumeInfo.ratingsCount ?? 0})"
            '(${ratingCount.toString()})',
          ),
        ),
      ],
    );
  }
}
