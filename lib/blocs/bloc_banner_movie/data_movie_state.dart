import 'package:demo_app_movie/models/banner_model.dart';
import 'package:demo_app_movie/models/movie_genre_model.dart';
import 'package:equatable/equatable.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object?> get props => [];
}

class BannerInit extends BannerState {
  const BannerInit();
}

class BannerLoading extends BannerState {
  const BannerLoading();
}

class BannerLoadSuccess extends BannerState{
  final BannerModel? bannerModel;
  const BannerLoadSuccess({this.bannerModel});

  @override
  List<Object?> get props => [bannerModel];
}

class BannerLoadError extends BannerState{
  final String? message;
  const BannerLoadError({this.message});

  @override
  List<Object?> get props => [message];
}