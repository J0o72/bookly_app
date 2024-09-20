import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.homeRepo) : super(BookDetailsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchDetailBooks({required String title}) async {
    emit(BookDetailsLoading());

    var result = await homeRepo.fetchDetailBooks(title: title);
    result.fold(
      (failure) {
        emit(BookDetailsFailure(errorMessage: failure.errMessage));
      },
      (books) {
        emit(BookDetailsSuccess(books: books));
      },
    );
  }
}
