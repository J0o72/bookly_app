import 'package:bookly/Features/home/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_circular_loading.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBookDetailsListView extends StatelessWidget {
  const SimilarBookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailsSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .18,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetailsView,
                            extra: state.books[index]);
                      },
                      child: BookListViewItem(
                        bookModel: state.books[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is BookDetailsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
