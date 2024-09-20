import 'package:bookly/Features/search/presentation/views/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    super.key,
  });

  final myController = TextEditingController();
  String? text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      onChanged: (value) {
        text = value;
      },
      onSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context)
            .fetchSearchResultBooks(title: value);

        myController.clear();
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SearchCubit>(context)
                .fetchSearchResultBooks(title: text!);

            myController.clear();
          },
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
