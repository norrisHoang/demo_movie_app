import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class DataMovieEvent extends Equatable {
  const DataMovieEvent();

  @override
  List<Object?> get props => [];
}

class RequestGetBanner extends DataMovieEvent {
  const RequestGetBanner();

  @override
  List<Object?> get props => [];
}

class RequestGetMovieCategories extends DataMovieEvent {
  const RequestGetMovieCategories();

  @override
  List<Object?> get props => [];
}
