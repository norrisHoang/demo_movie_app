import 'package:demo_app_movie/services/api_call.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_movie_event.dart';
import 'data_movie_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  ApiClient apiClient = ApiClient();

  BannerBloc() : super(const BannerInit()) {
    on<RequestGetBanner>((event, emit) async {
      await _handleGetBanner(emit);
    });
  }

  _handleGetBanner(Emitter emit) async {
    emit(const BannerLoading());
    try {
      final response = await apiClient.getBannerList();
      emit(BannerLoadSuccess(bannerModel: response));
    } catch (e) {
      emit(BannerLoadError(message: e.toString()));
    }
  }
}
