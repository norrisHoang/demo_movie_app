import 'package:demo_app_movie/services/api_call.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_movie_event.dart';
import 'data_movie_state.dart';

class DataMovieBloc extends Bloc<DataMovieEvent, DataMovieState> {
  ApiClient apiClient = ApiClient();

  DataMovieBloc() : super(const DataMovieInit()) {
    on<RequestGetBanner>((event, emit) async {
      await _handleGetBanner(emit);
    });
    on<RequestGetMovieCategories>((event, emit) async {
      await _handleGetBanner(emit);
    });
  }

  _handleGetBanner(Emitter emit) async {
    emit(const BannerLoading());
    try {
      final responseBanner = await apiClient.getBannerList();
      emit(BannerLoadSuccess(bannerModel: responseBanner));
    } catch (e) {
      emit(BannerLoadError(message: e.toString()));
    }

    emit(const CategorieLoading());
    try {
      final responseCategorie = await apiClient.getGenreList();
      emit(CategorieLoadSuccess(movieGenre: responseCategorie));
    } catch (e) {
      emit(CategorieLoadError(message: e.toString()));
    }
  }
}
