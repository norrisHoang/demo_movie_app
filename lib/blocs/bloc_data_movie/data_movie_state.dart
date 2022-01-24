import 'package:demo_app_movie/models/banner_model.dart';
import 'package:demo_app_movie/models/movie_genre_model.dart';
import 'package:equatable/equatable.dart';

abstract class DataMovieState extends Equatable {
  const DataMovieState();

  @override
  List<Object?> get props => [];
}

class DataMovieInit extends DataMovieState {
  const DataMovieInit();
}

class BannerLoading extends DataMovieState {
  const BannerLoading();
}

class BannerLoadSuccess extends DataMovieState {
  final BannerModel? bannerModel;

  const BannerLoadSuccess({this.bannerModel});

  @override
  List<Object?> get props => [bannerModel];
}

class BannerLoadError extends DataMovieState {
  final String? message;

  const BannerLoadError({this.message});

  @override
  List<Object?> get props => [message];
}

class CategorieLoading extends DataMovieState {
  const CategorieLoading();
}

class CategorieLoadSuccess extends DataMovieState {
  final CategorieModel? movieGenre;

  const CategorieLoadSuccess({this.movieGenre});

  @override
  List<Object?> get props => [movieGenre];
}

class CategorieLoadError extends DataMovieState {
  final String? message;

  CategorieLoadError({this.message});

  @override
  List<Object?> get props => [message];
}
