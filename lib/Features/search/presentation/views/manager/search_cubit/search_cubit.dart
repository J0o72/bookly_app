import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/search/presentation/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchResultBooks({required String title}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchResultBooks(title: title);
    result.fold(
      (failure) {
        emit(SearchFailure(errorMessage: failure.errMessage));
      },
      (books) {
        emit(SearchSuccess(books: books));
      },
    );
  }
}
