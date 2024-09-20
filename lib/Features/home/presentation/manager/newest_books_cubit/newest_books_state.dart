part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBookSuccess extends NewestBooksState {
  final List<BookModel> books;
  const NewestBookSuccess({required this.books});
}

final class NewestBookFailure extends NewestBooksState {
  final String errorMessage;

  const NewestBookFailure({required this.errorMessage});
}

final class NewestBookLoading extends NewestBooksState {}
