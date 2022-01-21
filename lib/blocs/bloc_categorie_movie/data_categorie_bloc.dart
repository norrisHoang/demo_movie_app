import 'package:demo_app_movie/services/api_call.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_categorie_event.dart';
import 'data_categorie_state.dart';

class CategorieBloc extends Bloc<CategorieEvent, CategorieState> {
  ApiClient apiClient = ApiClient();

  CategorieBloc() : super(const CategorieInit()) {
    // Get categories
    on<RequestGetMovieCategories>((event, emit) async {
      await _handleGetCategories(emit);
    });
    // Get banners
  }

  _handleGetCategories(Emitter emit) async {
    emit(const CategorieLoading());
    try {
      final response = await apiClient.getGenreList();
      emit(CategorieLoadSuccess(movieGenre: response));
    } catch (e) {
      emit(CategorieLoadError(message: e.toString()));
    }
  }
}
