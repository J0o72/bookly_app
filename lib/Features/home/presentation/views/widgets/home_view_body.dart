import 'package:bookly/Features/home/presentation/views/widgets/best_seller_books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          flexibleSpace: FlexibleSpaceBar(
            background: CustomAppBar(),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              // CustomAppBar(),
              SizedBox(
                height: 16,
              ),
              BookListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Newest Books",
                    style: Styles.styleText22,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        BestSellerBooksListView(),
      ],
    );
  }
}
