import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_app_movie/blocs/bloc_data_movie/data_movie_bloc.dart';
import 'package:demo_app_movie/blocs/bloc_data_movie/data_movie_event.dart';
import 'package:demo_app_movie/blocs/bloc_data_movie/data_movie_state.dart';
import 'package:demo_app_movie/models/banner_model.dart';
import 'package:demo_app_movie/models/movie_genre_model.dart';
import 'package:demo_app_movie/screens/screen_detail/detailMovie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TabInTheater extends StatefulWidget {
  @override
  TabInTheaterState createState() => TabInTheaterState();
}

class TabInTheaterState extends State<TabInTheater>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late final TabController _tabController;

  // Categories
  List<Genres> _genres = [];

  //Banner Movie
  List<Results> _banner = [];

  bool _isBannerLoading = false;

  // Request call categories
  _requestCategories() async {
    BlocProvider.of<DataMovieBloc>(context)
        .add(const RequestGetMovieCategories());
  }

  _requestBanner() async {
    BlocProvider.of<DataMovieBloc>(context).add(const RequestGetBanner());
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    // Request data movie's categories
    _requestCategories();
    _requestBanner();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataMovieBloc, DataMovieState>(
        builder: (context, state) => _buildUI(context),
        listener: (context, state) {
          if (state is CategorieLoading) {
            print('loading...');
          } else if (state is CategorieLoadSuccess) {
            print('Success...');
            _genres = state.movieGenre?.genres ?? [];
          } else if (state is CategorieLoadError) {
            print('message Error: ${state.message}');
          } else if (state is BannerLoading) {
            print('loading...');
            _isBannerLoading = true;
          } else if (state is BannerLoadSuccess) {
            print('Success...');
            _isBannerLoading = false;
            if (state.bannerModel != null &&
                state.bannerModel!.results != null) {
              _banner = state.bannerModel!.results!;
            }
          } else if (state is BannerLoadError) {
            print('message Error: ${state.message}');
            _isBannerLoading = false;
          }
        });
  }

  Widget _buildUI(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _categoryWidget(context),
            _carouselSliderHomeMovie(context),
          ],
        ),
      ),
    );
  }

  Widget _categoryWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      margin: EdgeInsets.only(bottom: 30, top: 30, left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _genres.length,
          itemBuilder: (context, index) {
            final item = _genres[index];
            return _myItemCategory(context, item);
          }),
    );
  }

  Widget _myItemCategory(BuildContext context, Genres item) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Text(item.name ?? ''),
    );
  }

  Widget _carouselSliderHomeMovie(BuildContext context) {
    if (_isBannerLoading) return Expanded(child: CupertinoActivityIndicator());
    return Visibility(
      visible: _banner.isNotEmpty,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: CarouselSlider.builder(
          itemCount: _banner.length,
          options: CarouselOptions(
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          itemBuilder: (context, i, id) {
            //for onTap to redirect to another screen
            final item = _banner[i];
            return _bannerMovie(context, i, item);
          },
        ),
      ),
    );
  }

  Widget _bannerMovie(
    BuildContext context,
    int i,
    Results item,
  ) {
    return GestureDetector(
      child: Container(
        //ClipRRect for image border radius
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Hero(
                tag: 'itemlv$i',
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(45)),
                  clipBehavior: Clip.antiAlias,
                  shadowColor: Colors.grey,
                  elevation: 30,
                  // đổ bóng
                  child: Image.network(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${item.posterPath}',
                    width: MediaQuery.of(context).size.width * 0.65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                item.title.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/icon_star_light_16x16.svg'),
                  SizedBox(width: 5),
                  Text(
                    item.voteAverage.toString(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => DetailMovie(index: i),
        ));
      },
    );
  }
}
