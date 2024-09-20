import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_actions_buttons.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: CustomBookImage(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                bookModel.volumeInfo.title.toString(),
                style: Styles.styleText30,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                bookModel.volumeInfo.authors![0],
                style: Styles.styleText20,
              ),
              const SizedBox(
                height: 10,
              ),
              BookRating(
                rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
                ratingCount: bookModel.volumeInfo.ratingsCount ?? 0,
              ),
              BookActionButtons(
                bookModel: bookModel,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.styleText18
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SimilarBookDetailsListView(),
            ],
          ),
        )
      ],
    );
  }
}
