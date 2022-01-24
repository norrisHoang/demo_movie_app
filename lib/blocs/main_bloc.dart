import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_data_movie/data_movie_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      // Data bloc
      BlocProvider<DataMovieBloc>(
        create: (BuildContext context) => DataMovieBloc(),
      ),
      // Theme bloc...
    ];
  }
}
