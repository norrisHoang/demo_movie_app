import 'package:demo_app_movie/models/banner_model.dart';
import 'package:demo_app_movie/models/movie_genre_model.dart';

abstract class ApiInterface {
  Future<CategorieModel> getGenreList();
  Future<BannerModel> getBannerList();
}