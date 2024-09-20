import 'package:bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: CustomSearchTextField(),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search Results:",
              style: Styles.styleText20,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Expanded(child: SearchResultListView()),
      ],
    );
  }
}
