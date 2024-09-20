import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/search/presentation/data/repos/search_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiService apiService;
  SearchRepoImplement(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResultBooks(
      {required String title}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=intitle:$title&Filtering=free-ebooks&maxResults=20&&printType=books");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
