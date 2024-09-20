import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_Details_button.dart';
import 'package:bookly/core/utils/functions/launch_url_book.dart';
import 'package:flutter/material.dart';

class BookActionButtons extends StatelessWidget {
  const BookActionButtons({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomBookDetailsButton(
              onPressed: () {},
              buttonBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              buttonColor: Colors.white,
              buttonFontSize: 22,
              buttonText: "Free",
              buttonTextColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomBookDetailsButton(
              onPressed: () async {
                print('URL: ${bookModel.volumeInfo.previewLink.toString()}');
                await launchUrlBook(
                    context, bookModel.volumeInfo.previewLink.toString());
              },
              buttonBorderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              buttonColor: const Color(0xffEF8262),
              buttonFontSize: 18,
              buttonText: "Free Preview",
              buttonTextColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
