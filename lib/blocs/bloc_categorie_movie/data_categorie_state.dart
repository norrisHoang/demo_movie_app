import 'package:demo_app_movie/models/movie_genre_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategorieState extends Equatable {
  const CategorieState();

  @override
  List<Object?> get props => [];
}

class CategorieInit extends CategorieState {
  const CategorieInit();
}

class CategorieLoading extends CategorieState {
  const CategorieLoading();
}

class CategorieLoadSuccess extends CategorieState {
  final CategorieModel? movieGenre;

  const CategorieLoadSuccess({this.movieGenre});

  @override
  List<Object?> get props => [movieGenre];
}

class CategorieLoadError extends CategorieState {
  final String? message;

  CategorieLoadError({this.message});

  @override
  List<Object?> get props => [message];
}
