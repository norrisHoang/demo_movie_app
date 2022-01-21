import 'dart:convert';
import 'package:demo_app_movie/models/banner_model.dart';
import 'package:demo_app_movie/models/movie_genre_model.dart';
import 'package:http/http.dart' as http;
import 'api_constants.dart';
import 'api_interfaces.dart';

class ApiClient extends ApiInterface{

  @override
  Future<CategorieModel> getGenreList() async {
    final response = await http.get(Uri.parse(baseUrl + categoryUrl + '?api_key=$apiKey' + '&language=en-US' + '&page=$pageUrl'));
    if (response.statusCode == 200) {
      return CategorieModel.fromJson(json.decode(response.body));
    } else {
      var message = response.body;
      print(message);
      return throw Exception('Error: Service Not Available. Please try later');
    }
  }

  @override
  Future<BannerModel> getBannerList() async {
    final response = await http.get(Uri.parse(baseUrl + suggestListUrl + '?api_key=$apiKey' + '&language=en-US'));
    if (response.statusCode == 200) {
      return BannerModel.fromJson(json.decode(response.body));
    } else {
      var message = response.body;
      print(message);
      return throw Exception('Error: Service Not Available. Please try later');
    }
  }

}