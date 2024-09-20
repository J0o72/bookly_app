import 'package:bookly/Features/home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:bookly/Features/search/presentation/views/manager/search_cubit/search_cubit.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_circular_loading.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
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
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchInitial) {
          return const Center(
            child: Text("There No Results Yet, Search Now"),
          );
        } else {
          return const CustomCircularLoading();
        }
      },
    );
  }
}
