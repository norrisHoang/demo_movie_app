import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_app_movie/blocs/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'screens/tab_box_office.dart';
import 'screens/tab_coming_soon.dart';
import 'screens/tab_in_theater.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainBloc.allBlocs(),
      child: const MaterialApp(
        home: HomeMovie(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomeMovie extends StatefulWidget {
  const HomeMovie({Key? key}) : super(key: key);

  @override
  HomeMovieState createState() => HomeMovieState();
}

class HomeMovieState extends State<HomeMovie>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          toolbarHomeMovie(context),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: MediaQuery.of(context).size.height * 0.08,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              labelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                insets: EdgeInsets.only(left: 15, right: 100),
                borderSide: BorderSide(
                  color: Color.fromRGBO(254, 109, 142, 1),
                  width: 5.0,
                ),
              ),
              unselectedLabelColor: Color.fromRGBO(18, 21, 61, 0.3),
              tabs: const [
                // First tab
                Padding(padding: EdgeInsets.only(bottom: 20), child: Text(
                  'In Theater',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                )),
                // Second tab
                Padding(padding: EdgeInsets.only(bottom: 20), child: Text(
                  'Box Office',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                )),
                // Third tab
                Padding(padding: EdgeInsets.only(bottom: 20), child: Text(
                  'Comming Soon',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  TabInTheater(),
                  TabBoxOffice(),
                  TabComingSoon(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget toolbarHomeMovie(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            child: GestureDetector(
                onTap: () {}, child: SvgPicture.asset('images/icon_menu_24x24.svg')),
          ),
          Container(
            width: 40,
            child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('images/icon_search_24x24.svg')),
          ),
        ],
      ),
    );
  }
}
