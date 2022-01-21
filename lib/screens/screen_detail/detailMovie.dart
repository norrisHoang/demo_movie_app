import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailMovie extends StatefulWidget {
  final int index;

  DetailMovie({required this.index, Key? key}) : super(key: key);

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  final List<String> categoryList = ['aưe121', 'b 123131 ', 'c wqe qwe wq '];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _bannerDetailMovie(context),
              _headerDetailMovie(context),
              _categoryWidget(context),
              _plotSummaryWidget(context),
              _listCastAndCrew(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerDetailMovie(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Column(children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              child: new Hero(
                tag: 'itemlv${widget.index}',
                child: Image.asset(
                  'images/image_item_detail_470x352.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
                top: 25,
                left: 22,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: ShapeDecoration(shape: CircleBorder()),
                    child: SvgPicture.asset('images/icon_back_7x14.svg'),
                  ),
                )),
            Positioned(right: 0, bottom: -40, child: _containerTaskBar(context))
          ],
        ),
      ]),
    );
  }

  Widget _containerTaskBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(18, 21, 61, 0.2),
                blurRadius: 8,
                spreadRadius: -1,
                offset: Offset(0, 13))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SvgPicture.asset('images/icon_star_light_26x26.svg'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '8.2/10',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text('124000',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9A9BB2))),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset('images/icon_star_dark_26x26.svg'),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Rate This',
                  style: TextStyle(
                      wordSpacing: 3,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SizedBox(
                  height: 13,
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: 28,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(81, 207, 102, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Text(
                  '86',
                  style: TextStyle(
                      wordSpacing: 3,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Metascore',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text('62 critic reviews',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff9A9BB2))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerDetailMovie(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 40, right: 30),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Ford v Ferrari',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      wordSpacing: 10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Text(
                      '2019 PG-20 ',
                      style: TextStyle(
                          wordSpacing: 20,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff9A9BB2)),
                    ),
                    Text(
                      '2h 30',
                      style: TextStyle(
                          wordSpacing: 5,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff9A9BB2)),
                    ),
                  ],
                ),
              )
            ],
          )),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                color: Color(0xffFE6D8E),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('images/icon_add_28x28.svg'),
          )
        ],
      ),
    );
  }

  Widget _categoryWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      margin: EdgeInsets.only(bottom: 40, top: 20, left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) =>
            _myItemCategory(context, index),
      ),
    );
  }

  Widget _myItemCategory(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      margin: EdgeInsets.only(
        left: 15,
      ),
      child: Text(categoryList[index], style: TextStyle(fontSize: 14)),
    );
  }

  Widget _plotSummaryWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 30, bottom: 15),
          child: Text(
            'Plot Summary',
            style: TextStyle(fontSize: 22, wordSpacing: 10),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 30, bottom: 20, right: 30),
          child: Text(
            'American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.',
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff737599),
                wordSpacing: 3,
                height: 1.5),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _listCastAndCrew(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30),
          alignment: Alignment.centerLeft,
          child: Text(
            'Cast & Crew',
            style: TextStyle(fontSize: 22, wordSpacing: 10),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 14,
            itemBuilder: (BuildContext context, index) =>
                _myItemListView(context, index),
          ),
        ),
      ],
    );
  }

  Widget _myItemListView(BuildContext context, int index) {
    return Container(
      color: Colors.pinkAccent,
      width: 80,
      margin: EdgeInsets.only(left: 20, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: Image.network(
              'https://lthumb.lisimg.com/421/20738421.jpg?width=80&sharpen=true&aspect_ratio=1:1&crop_gravity=north',
              height: 80,
              width: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: Text(
              'Caitriona Balfe asdas sd',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            'Mollie',
            maxLines: 2,
            style: TextStyle(
                wordSpacing: 3,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff9A9BB2)),
          )
        ],
      ),
    );
  }
}
