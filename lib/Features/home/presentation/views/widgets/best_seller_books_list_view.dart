import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_circular_loading.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BestSellerBooksListView extends StatelessWidget {
  const BestSellerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   // shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return const Padding(
    //       padding: EdgeInsets.only(bottom: 16),
    //       child: BestSellerBookItem(),
    //     );
    //   },
    // );

    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: BestSellerBookItem(
                      bookModel: state.books[index],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is NewestBookFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(errorMessage: state.errorMessage));
        } else {
          return const SliverToBoxAdapter(child: CustomCircularLoading());
        }
      },
    );
  }
}
