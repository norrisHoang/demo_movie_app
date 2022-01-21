import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_banner_movie/data_movie_bloc.dart';
import 'bloc_categorie_movie/data_categorie_bloc.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      // Data bloc
      BlocProvider<BannerBloc>(
        create: (BuildContext context) => BannerBloc(),
      ),
      BlocProvider<CategorieBloc>(
        create: (BuildContext context) => CategorieBloc(),
      ),
      // Theme bloc...
    ];
  }
}
