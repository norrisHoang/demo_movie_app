import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategorieEvent extends Equatable {
  const CategorieEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetMovieCategories extends CategorieEvent {
  const RequestGetMovieCategories();

  @override
  List<Object?> get props => [];
}
